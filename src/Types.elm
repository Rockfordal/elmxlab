port module Types exposing (..)

import Http
import Time exposing (Time, second)


type alias Model =
  { shelfs     : List Shelf
  , shelf      : Shelf
  , items      : List Item
  , item       : Item
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
  = FetchShelfSucceed (List Shelf)
  | FetchItemSucceed (List Item)
  | FetchFail Http.Error
  | SetShelf Int
  -- | Tick Time
