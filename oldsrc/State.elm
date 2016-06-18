port module State exposing (..)

import Types exposing (Model, Msg(..))

port alert : String -> Cmd msg

init : (Model, Cmd msg)
init =
  (Model 0 0 "It works!" [], Cmd.none)


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Increment ->
      ({ model | count = model.count + 1 }, Cmd.none)

    Decrement ->
      ({ model | count = model.count - 1 }, Cmd.none)

    Tick ->
      ({ model | elapsed = model.elapsed + 1}, Cmd.none)

    Alert ->
      (model, alert model.alertText)

    ChangeAlertText text ->
      ({ model | alertText = text }, Cmd.none)

    Log text ->
      ({ model | logs = text :: model.logs }, Cmd.none)
