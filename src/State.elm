module State exposing (..)
import Types exposing (Model, Msg(..))


model : Model
model =
  Model "" "" ""


update : Msg -> Model -> Model
update action model =
  case action of
    Name name ->
      { model | name = name }

    Password password ->
      { model | password = password }

    PasswordAgain password ->
      { model | passwordAgain = password }
