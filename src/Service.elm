module Service exposing (..)

import Task exposing (Task)
import Json.Decode exposing (..)
import Http


url : String
url = "http://localhost:4000/graphql"


query : String -> String -> Decoder a -> Task Http.Error a
query url query decoder =
  Http.get
    (queryResult decoder)
    (Http.url
      url
      [ ( "query", query )
      ]
    )


queryResult : Decoder a -> Decoder a
queryResult decoder =
  -- todo: check for success/failure of the query
  oneOf
    [ at [ "data" ] decoder
    , fail "expecting data"
      -- todo: report failure reason from server
    ]


apply : Decoder (a -> b) -> Decoder a -> Decoder b
apply func value =
  object2 (<|) func value
