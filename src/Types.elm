port module Types exposing (..)

import Http
import Time exposing (Time, second)


type alias Model =
  {
    topic      : String
  , gifUrl     : String
  , shelf      : Shelf
  , shelfs     : List Shelf
  , shelfindex : Int
  , items      : List Item
  , counter    : Int
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
  = MorePlease
  | FetchShelfSucceed (List Shelf)
  | FetchItemSucceed (List Item)
  | FetchFail Http.Error
  | UpdateTopic String
  | SetShelf Int
  -- | Tick Time
