port module Types exposing (..)


type alias Model =
  { count : Int
  , elapsed : Int
  , alertText : String
  , logs : List String
  }

type Msg = Increment | Decrement | Tick | Alert | ChangeAlertText String | Log String
