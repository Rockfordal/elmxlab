module Service exposing (..)

import Types exposing (Model, Msg(..), Shelf, Item)
import Task exposing (Task)
import Json.Decode exposing (..)
import Json.Encode as JSEncode
import Http
import String
import Data    exposing (s1, i1)


baseUrl : String
baseUrl = "http://fire.solidcrm.se:3000/"


stringToInt : Decoder String -> Decoder Int
stringToInt d =
  customDecoder d String.toInt


getShelfs : Cmd Msg
getShelfs =
  let url = "http://fire.solidcrm.se:3000/shelfs"
  in Task.perform FetchFail FetchShelfSucceed (Http.get decodeShelfUrl url)

jsonBody : String -> String
jsonBody str =
    JSEncode.encode
        0
        (JSEncode.object
            [ ( "name", JSEncode.string "damnelm2" )
            , ( "size", JSEncode.int 16 )
            ]
        )


postShelf : Cmd Msg
postShelf =
  let url = "http://fire.solidcrm.se:3000/shelfs"
      token = "Basic dXNlcjpwYXNzd29yZA=="
  in  Task.perform CreateShelfFail CreatedShelf (postJson token)


postJson : String -> Platform.Task Http.RawError Http.Response
postJson token =
  let
      appjson = "application/json"
      contentJson = ( "Content-Type", appjson )
      -- acceptJson  = ( "Accept",       appjson )
  in
      Http.send
          Http.defaultSettings
          { verb = "POST"
          , headers =
              [ contentJson
              , ("Authorization", token)
              ]
          , url = "http://fire.solidcrm.se:3000/shelfs"
          , body = Http.string (jsonBody """{ "name": "hohallan", "size": 15 }""")
          }

realdelete : String -> Int -> String -> Platform.Task Http.RawError Http.Response
realdelete url id token =
  Http.send
      Http.defaultSettings
      { verb = "DELETE"
      , url = baseUrl ++ url ++ toString id
      , body = Http.empty -- Http.string ""
      , headers = [ ("Content-Type", "application/json")
                  , ("Authorization", token)]
      }

deleteShelf : Int -> Cmd Msg
deleteShelf id =
  let shelf = "shelfs/"
      token = "Basic dXNlcjpwYXNzd29yZA=="
  in  Task.perform DeleteShelfFail DeletedShelf (realdelete shelf id token)
  -- in  Task.perform FetchFail DeletedShelf (realdelete shelf id token)


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

decodeShelfPostUrl : Decoder Shelf
decodeShelfPostUrl =
  shelfDecoder

decodeShelfUrl : Decoder (List Shelf)
decodeShelfUrl =
  list shelfDecoder

decodeItemUrl : Decoder (List Item)
decodeItemUrl =
  list itemDecoder
