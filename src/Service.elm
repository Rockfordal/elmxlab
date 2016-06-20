module Service exposing (..)

import Types exposing (Model, Msg(..))
import Task exposing (Task)
import Json.Decode as Json
import Http


getRandomGif : String -> Cmd Msg
getRandomGif topic =
  let
    url =
      --  "http://labben.urkraft.se/wp-json/wp/v2/posts"
      "http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=" ++ topic
  in
    Task.perform FetchFail FetchSucceed (Http.get decodeGifUrl url)


fullNameDecoder : Json.Decoder String
fullNameDecoder =
  -- Json.object1 identity ("full_name" := Json.string)
  Json.at ["content", "rendered"] Json.string

-- decodeGifUrl : Json.Decoder (List String)
decodeGifUrl : Json.Decoder String
decodeGifUrl =
  -- (Json.list fullNameDecoder)
  Json.at ["data", "image_url"] Json.string
