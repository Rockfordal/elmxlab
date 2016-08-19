port module Types exposing (..)

import Http
import Routes exposing (Sitemap(..))


type alias Model =
  {
    route      : Sitemap
  , shelfs     : List Shelf
  , items      : List Item
  , shelf      : Shelf
  , item       : Item
  , ready      : Bool
  }

type alias Shelf =
  {
    id       : Int
  , label    : String
  , size     : Int
  -- , position : Int
  }

type alias Item =
  {
    id      : Int
  , name    : String
  , info    : String
  }

type Msg
  = RouteTo Sitemap
  | FetchShelfSucceed (List Shelf)
  | FetchItemSucceed (List Item)
  | FetchFail Http.Error
  | SetShelf Int

  | CreateShelf
  | CreatedShelf Http.Response
  | CreateShelfFail Http.RawError

  | DeleteShelf Int
  | DeleteShelfFail Http.RawError
  | DeletedShelf Http.Response
  | NoOp

type alias Url = String
