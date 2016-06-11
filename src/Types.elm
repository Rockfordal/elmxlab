module Types exposing (..)


type alias Model =
  { posts : List Post }

type alias Post =
  { title : String,
    content : String
  }

type Msg
    = UpdateTitle String
    | Pang
