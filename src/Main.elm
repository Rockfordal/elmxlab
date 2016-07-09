module Main exposing (main)

import State exposing (init, update)
import Types exposing (Model, Msg(..))
import View  exposing (view)
import Html.App exposing (program)
-- import Time exposing (every, second)

main : Program Never
main =
  program
    { init = init "cats"
    , update = update
    , subscriptions = subscriptions
    , view = view
    }


subscriptions : Model -> Sub Msg
subscriptions model =
  -- every second Tick
  Sub.none
  -- Sub.batch []
