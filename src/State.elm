module State exposing (..)
import Types exposing (Model, Msg(..))
import Service 
import Maybe exposing (..)
import Task exposing (..)

model : Model
model =
  Model "" "" "" "93200" ["place1", "place2"]


update : Msg -> Model -> Model
update action model =
  case action of
    Name name ->
      { model | name = name }

    Password password ->
      { model | password = password }

    PasswordAgain password ->
      { model | passwordAgain = password }
