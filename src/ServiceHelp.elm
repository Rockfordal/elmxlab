module ServiceHelp exposing (..)
import Decoders exposing (..)
import Http


baseUrl : String
baseUrl = "http://fire.solidcrm.se:3000/"


shelfUrl : String
shelfUrl  = baseUrl ++ "shelfs"


authToken : String
authToken = "Basic dXNlcjpwYXNzd29yZA=="


appJSON : String
appJSON = "application/json"


contentJSON : (String, String)
contentJSON = ("Content-Type", appJSON)


acceptJSON : (String, String)
acceptJSON = ("Accept", appJSON)


sendJSON : String -> String -> String -> Http.Body -> Platform.Task Http.RawError Http.Response
sendJSON url method token body =
  Http.send
      Http.defaultSettings
      { verb = method
      , url = url
      , headers =
        [ contentJSON
        , ("Authorization", token)
        ]
      , body = body
      }


postJson : String -> Http.Body -> String -> Platform.Task Http.RawError Http.Response
postJson url body token = sendJSON url "POST" token body


realdelete : String -> Int -> String -> Platform.Task Http.RawError Http.Response
realdelete url id token =
  let
      url = url ++ "/" ++ toString id
      body = Http.empty
  in
      sendJSON url "DELETE" token body


testBody : Http.Body
testBody = Http.string (jsonBody """{ "name": "hohallan", "size": 15 }""")
