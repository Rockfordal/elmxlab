module Main exposing (main)

import Navigation
import Routes
import State exposing (update, urlUpdate, init)
import Types exposing (Model, Msg)
import View exposing (view)
-- import Time exposing (every, second)

main : Program Never
main =
  Navigation.program (Navigation.makeParser Routes.parsePath)
      { init = init
      , update = update
      , urlUpdate = urlUpdate
      , view = view
      , subscriptions = subscriptions
      }

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
  -- every second Tick
  -- Sub.batch []
