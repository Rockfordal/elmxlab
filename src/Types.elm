port module Types exposing (..)


type alias Model =
  { posts : List Post
  , post : Post
  }


type alias Post =
  { title : String
  , content : String
  , id : Int
  }

type Msg
    = UpdateTitle String
    | Pang
    | Texas
    | Stöd
    | Grillparty
    | SetPost Int
