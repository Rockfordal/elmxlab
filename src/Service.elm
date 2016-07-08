module Service exposing (..)

import Types exposing (Model, Msg(..), Post)
import Task exposing (Task)
import Json.Decode exposing (..)
import Http
import String


getPosts : Cmd Msg
getPosts =
  -- let url = "http://labben.urkraft.se/wp-json/wp/v2/posts"
  let url = "http://fire.solidcrm.se:3000/books"
  in Task.perform FetchFail FetchSucceed (Http.get decodePostUrl url)


stringToInt : Decoder String -> Decoder Int
stringToInt d =
  customDecoder d String.toInt


postDecoder : Decoder Post
postDecoder =
  object6 Post
    (at ["id"]      int)
    (at ["title"]   string)
    (at ["content"] string)
    (at ["author"]  string)
    (at ["user_id"] int)
    (at ["year"]    int)

    -- (at ["id"]      string |> stringToInt)
    -- (at ["title"]   string)
    -- (at ["content"] string)
    -- (at ["author"]  string)
    -- (at ["user_id"] string |> stringToInt)
    -- (at ["year"]    string |> stringToInt)

decodePostUrl : Decoder (List Post)
decodePostUrl =
  list postDecoder
