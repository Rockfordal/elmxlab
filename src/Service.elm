module Service exposing (..)

import Types exposing (Model, Msg(..), Shelf)
import Task exposing (Task)
import Json.Decode exposing (..)
import Http
import String


getShelfs : Cmd Msg
getShelfs =
  -- let url = "http://labben.urkraft.se/wp-json/wp/v2/posts"
  let url = "http://fire.solidcrm.se:3000/shelfs"
  in Task.perform FetchFail FetchSucceed (Http.get decodeShelfUrl url)


stringToInt : Decoder String -> Decoder Int
stringToInt d =
  customDecoder d String.toInt


shelfDecoder : Decoder Shelf
shelfDecoder =
  object3 Shelf
    (at ["id"]   int)
    (at ["name"] string)
    (at ["size"] int)


decodeShelfUrl : Decoder (List Shelf)
decodeShelfUrl =
  list shelfDecoder
