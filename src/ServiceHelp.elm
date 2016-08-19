module ServiceHelp exposing (..)

import Decoders exposing (..)
import Http     exposing (..)
import String   exposing (..)
import Result   exposing (Result(..), toMaybe)
import Types    exposing (Url)


baseUrl : Url
baseUrl = "http://fire.solidcrm.se:3000/"


shelfUrl : Url
shelfUrl = baseUrl ++ "shelfs"


authToken : String
authToken = "Basic dXNlcjpwYXNzd29yZA=="


appJSON : String
appJSON = "application/json"


contentJSON : (String, String)
contentJSON = ("Content-Type", appJSON)


acceptJSON : (String, String)
acceptJSON = ("Accept", appJSON)


jsonHeaders : String -> List (String, String)
jsonHeaders token =
  [ contentJSON
  , ("Authorization", token)
  ]


sendJSON : Url -> String -> String -> Http.Body -> Platform.Task Http.RawError Http.Response
sendJSON url method token body =
  Http.send
      Http.defaultSettings
      { verb    = method
      , url     = url
      , body    = body
      , headers = jsonHeaders token
      }


postJson : Url -> Http.Body -> String -> Platform.Task Http.RawError Http.Response
postJson url body token = sendJSON url "POST" token body


realdelete : Url -> Int -> String -> Platform.Task Http.RawError Http.Response
realdelete url id token =
  let
      url = url ++ "/" ++ toString id
      body = Http.empty
  in
      sendJSON url "DELETE" token body


testBody : Http.Body
testBody = Http.string (jsonBody """{ "name": "hohallan", "size": 15 }""")


resToInt : Value -> Maybe Int
resToInt value =
  let
    sid =
      case value of
          Http.Text v -> v
          _           -> "0"
  in
    (toMaybe << toInt) sid
