module Service exposing (..)

import Types exposing (Model, Msg(..), Post)
import Task exposing (Task)
import Json.Decode exposing (..)
import Http
import String


getPosts : Cmd Msg
getPosts =
  let url = "http://labben.urkraft.se/wp-json/wp/v2/posts"
  in Task.perform FetchFail FetchSucceed (Http.get decodePostUrl url)


stringToInt : Decoder String -> Decoder Int
stringToInt d =
  customDecoder d String.toInt


postDecoder : Decoder Post
postDecoder =
  object3 Post
    (at ["id",      "rendered"] string |> stringToInt)
    (at ["title",   "rendered"] string)
    (at ["content", "rendered"] string)


decodePostUrl : Decoder (List Post)
decodePostUrl =
  list postDecoder
