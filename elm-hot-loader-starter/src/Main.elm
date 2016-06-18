module Main exposing (main)

import State exposing (model, update)
import Types exposing (Model, Msg)
import View  exposing (view)
import Html.App as Html


main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }
