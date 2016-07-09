module Service exposing (..)

import Types exposing (Model, Msg(..), Shelf, Item)
import Task exposing (Task)
import Json.Decode exposing (..)
import Http
import String


stringToInt : Decoder String -> Decoder Int
stringToInt d =
  customDecoder d String.toInt


getShelfs : Cmd Msg
getShelfs =
  let url = "http://fire.solidcrm.se:3000/shelfs"
  in Task.perform FetchFail FetchShelfSucceed (Http.get decodeShelfUrl url)

getItems : Cmd Msg
getItems =
  let url = "http://fire.solidcrm.se:3000/items"
  in Task.perform FetchFail FetchItemSucceed (Http.get decodeItemUrl url)


shelfDecoder : Decoder Shelf
shelfDecoder =
  object3 Shelf
    (at ["id"]   int)
    (at ["name"] string)
    (at ["size"] int)

itemDecoder : Decoder Item
itemDecoder =
  object3 Item
    (at ["id"]   int)
    (at ["name"] string)
    (at ["info"] string)


decodeShelfUrl : Decoder (List Shelf)
decodeShelfUrl =
  list shelfDecoder

decodeItemUrl : Decoder (List Item)
decodeItemUrl =
  list itemDecoder
