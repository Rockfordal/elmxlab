module Main exposing (main)

import State exposing (initialmodel, update)
import View  exposing (view)
import Html.App as Html


main : Program Never
main =
  Html.beginnerProgram
    { model = initialmodel
    , view = view
    , update = update
    }
