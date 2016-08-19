port module Types exposing (..)

import Http
import Routes exposing (Sitemap(..))


type alias Model =
  {
    route      : Sitemap
  , shelfs     : List Shelf
  , shelf      : Shelf
  , items      : List Item
  , item       : Item
  , ready      : Bool
  }

type alias Shelf =
  {
    id      : Int
  , name    : String
  , size    : Int
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
