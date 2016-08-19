module Service exposing (..)

import Types exposing (Model, Msg(..), Shelf, Item)
import Task exposing (Task)
import Decoders exposing (..)
import Http
import ServiceHelp exposing (shelfUrl, itemUrl, postJSON, deleteJSON, authToken, testBody)


-- Shelfs
getShelfs : Cmd Msg
getShelfs = Task.perform FetchFail FetchShelfSucceed (Http.get decodeShelfUrl shelfUrl)


postShelf : Cmd Msg
postShelf = Task.perform CreateShelfFail CreatedShelf (postJSON shelfUrl testBody authToken)


deleteShelf : Int -> Cmd Msg
deleteShelf id = Task.perform DeleteShelfFail DeletedShelf (deleteJSON shelfUrl id authToken)

-- Items
getItems : Cmd Msg
getItems = Task.perform FetchFail FetchItemSucceed (Http.get decodeItemUrl itemUrl)
