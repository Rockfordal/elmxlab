module Main exposing (main)

import State exposing (init, update)
import Types exposing (Model, Msg(..))
import View  exposing (view)
import Html.App as Html

main : Program Never
main =
  Html.program
    { init = init "cats"
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
