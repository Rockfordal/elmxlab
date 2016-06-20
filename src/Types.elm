port module Types exposing (..)
import Http

type alias Model =
  { topic  : String
  , gifUrl : String
  , posts  : List String
  -- , posts  : List Post
  -- , post : Post
  }


type alias Post =
  { title : String
  , content : String
  , id : Int
  }


type Msg
  = MorePlease
  | FetchSucceed (List String)
  | FetchFail Http.Error
  | UpdateTopic String
  -- | Pang
  -- | Texas
  -- | Stöd
  -- | Grillparty
  -- | SetPost Int
