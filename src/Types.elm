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

-- type alias Post =
--   {
--     id      : Int
--   , title   : String
--   , content : String
--   , author  : String
--   , user_id : Int
--   , year    : Int
--   }

type Msg
  = MorePlease
  | FetchSucceed (List Shelf)
  | FetchFail Http.Error
  | UpdateTopic String
  | SetShelf Int
  | Tick Time
