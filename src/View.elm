module View exposing (..)
import Types exposing (Model, Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import List exposing (map)


viewValidation : Model -> Html msg
viewValidation model =
  let
    (color, message) =
      if model.password == model.passwordAgain then
        ("green", "OK")
      else
        ("red", "Passwords do not match!")
  in
    Html.div [Html.Attributes.attribute "style" ("color:" ++ color)] [Html.text message]


showError : List (Html.Attribute ()) -> Html ()
showError errorAttrs = Html.span errorAttrs [Html.text "Oops!"]


login : Model -> Html Msg
login model =
  Html.div [] [
    Html.input [Html.Attributes.attribute "type" "text", Html.Attributes.attribute "placeholder" "Name", (onInput Name)] []
    , Html.input [Html.Attributes.attribute "type" "password", Html.Attributes.attribute "placeholder" "Password", (onInput Password)] []
    , Html.input [Html.Attributes.attribute "type" "password", Html.Attributes.attribute "placeholder" "Re-enter Password", (onInput PasswordAgain)] []
    , viewValidation model
  ]

view : Model -> Html Msg
view model =
  let
    hello = Html.h1 [] [Html.span [Html.Attributes.attribute "style" "color: green"] [Html.text "Tjena2, ", Html.b [] [Html.text "elmx!"]]]
    name = "Homer"
    lis = map (\s -> Html.li [Html.Attributes.attribute "class" "collection-item"] [Html.text s]) [ "Bart", "List", "Maggie" ]
    commonAttrs =
      [ title "common title"
      , align "left"
      ]
  in
  Html.div [] [
      Html.div ([Html.Attributes.attribute "class" "container"] ++ commonAttrs) [
        hello
        , Html.p [] [Html.a [Html.Attributes.attribute "class" "waves-effect waves-light btn"] [Html.text "button"]]
        , Html.text name, Html.text " is the father of:
        ", Html.ul [Html.Attributes.attribute "class" "collection"] lis
      ]
  ]
