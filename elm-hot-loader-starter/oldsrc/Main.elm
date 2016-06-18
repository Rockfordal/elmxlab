port module Main exposing (..)

import Types exposing (Model, Msg)
import State exposing (init, update)
import Types exposing (Model, Msg(..))
import View  exposing (view)
import Ports exposing (log, subscriptions)
--import Service exposing (query)

import Html.App exposing (program)


main : Program Never
main =
  program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
