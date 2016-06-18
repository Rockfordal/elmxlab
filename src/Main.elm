module Main exposing (main)

import State exposing (model, update)
import View  exposing (view)
import Html.App as Html


main : Program Never
main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }
