module Main exposing (main)

import State exposing (init, update)
import Types exposing (Model, Msg(..))
import View  exposing (view)
import Html.App as App

main : Program Never
main =
  App.program
    { init = init "cats"
    , update = update
    , subscriptions = subscriptions
    , view = view
    }


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
  -- Sub.batch []
