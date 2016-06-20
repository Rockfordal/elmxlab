module Service exposing (..)

import Types exposing (Model, Msg(..))
import Task exposing (Task)
-- import Json.Decode as Json
import Json.Decode exposing (..)
import Http


getRandomGif : String -> Cmd Msg
getRandomGif topic =
  let
    url =
      -- "http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=" ++ topic
       "http://labben.urkraft.se/wp-json/wp/v2/posts"
  in
    -- Task.perform FetchFail FetchSucceed (Http.get decodeGifUrl url)
    Task.perform FetchFail FetchSucceed (Http.get decodePostUrl url)

postDecoder : Decoder String
postDecoder =
  at ["content", "rendered"] string
  -- object1 identity ("full_name" := string)

decodePostUrl : Decoder (List String)
decodePostUrl =
  (list postDecoder)

decodeGifUrl : Decoder String
decodeGifUrl =
  at ["data", "image_url"] string

-- point : Decoder (Float, Float)
-- point =
--     object2 (,)
--       ("x" := float)
--       ("y" := float)
