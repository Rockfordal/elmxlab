port module Ports exposing (..)

import Types exposing (Model, Msg(..))
import Time

port log : (String -> msg) -> Sub msg


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.batch
    [ Time.every Time.second <| always Tick
    , log Log
    ]
