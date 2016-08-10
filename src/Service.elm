module Service exposing (..)

import Types exposing (Model, Msg(..), Shelf, Item)
import Task exposing (Task)
import Json.Decode exposing (..)
import Json.Encode as JSEncode
import Http
import String
import Data    exposing (s1, i1)


fire = "http://fire.solidcrm.se:3000"
anlu = "http://172.16.1.7:3000"

baseUrl = anlu

stringToInt : Decoder String -> Decoder Int
stringToInt d = customDecoder d String.toInt


getShelfs : Cmd Msg
getShelfs =
  let url = baseUrl ++ "/shelfs"
  in Task.perform FetchFail FetchShelfSucceed (Http.get decodeShelfUrl url)


jsonBody : String -> String
jsonBody str =
    JSEncode.encode
        0
        (JSEncode.object
            [ ( "label", JSEncode.string "damnelm2" )
            , ( "size",  JSEncode.int 16 )
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
          , body = Http.string (jsonBody """{ "label": "hohallan", "size": 15 }""")
          }


realdelete : String -> Int -> String -> Platform.Task Http.RawError Http.Response
realdelete url id token =
  Http.send
      Http.defaultSettings
      { verb    = "DELETE"
      , url     = baseUrl ++ url ++ toString id
      , body    = Http.empty -- Http.string ""
      , headers = [ ("Content-Type", "application/json")
                  , ("Authorization", token)]
      }


deleteShelf : Int -> Cmd Msg
deleteShelf id =
  let token = "Basic dXNlcjpwYXNzd28yZA=="
  in  Task.perform DeleteShelfFail DeletedShelf (realdelete "/shelfs/" id token)
  -- in  Task.perform FetchFail DeletedShelf (realdelete shelf id token)


getItems : Cmd Msg
getItems =
  let url = baseUrl ++ "/items"
  in Task.perform FetchFail FetchItemSucceed (Http.get decodeItemUrl url)


shelfDecoder : Decoder Shelf
shelfDecoder =
  object3 Shelf
    (at ["id"]    int)
    (at ["label"] string)
    (at ["size"]  int)

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
