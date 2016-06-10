module Types exposing (..)


type alias Model =
  { name : String
  , password : String
  , passwordAgain : String
  , query : String
  , results : List String
  }


type Msg
    = Name String
    | Password String
    | PasswordAgain String
