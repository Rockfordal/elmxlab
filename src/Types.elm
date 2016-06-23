port module Types exposing (..)

import Http
import Time exposing (Time, second)


type alias Model =
  {
    topic     : String
  , gifUrl    : String
  , post      : Post
  , posts     : List Post
  , postindex : Int
  , counter   : Int
  }


type alias Post =
  {
    id      : Int
  , title   : String
  , content : String
  }


type Msg
  = MorePlease
  | FetchSucceed (List Post)
  | FetchFail Http.Error
  | UpdateTopic String
  | SetPost Int
  | Tick Time
