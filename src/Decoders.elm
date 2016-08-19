module Decoders exposing (..)
import Json.Decode exposing (..)
import Json.Encode as JSEncode
import Types exposing (Shelf, Item)
import String


jsonBody : String -> String
jsonBody str =
  JSEncode.encode
      0
      (JSEncode.object
          [ ( "name", JSEncode.string "damnelm2" )
          , ( "size", JSEncode.int 16 )
          ])


stringToInt : Decoder String -> Decoder Int
stringToInt d =
  customDecoder d String.toInt


shelfDecoder : Decoder Shelf
shelfDecoder =
  object3 Shelf
    (at ["id"]   int)
    (at ["label"] string)
    (at ["size"] int)


itemDecoder : Decoder Item
itemDecoder =
  object3 Item
    (at ["id"]   int)
    (at ["name"] string)
    (at ["info"] string)


decodeShelfPostUrl : Decoder Shelf
decodeShelfPostUrl = shelfDecoder


decodeShelfUrl : Decoder (List Shelf)
decodeShelfUrl = list shelfDecoder


decodeItemUrl : Decoder (List Item)
decodeItemUrl = list itemDecoder
