module View exposing (..)
import Types exposing (Model, Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import List exposing (map)


view : Model -> Html Msg
view model =
  let
    hello = Html.h1 [] [Html.span [Html.Attributes.attribute "style" "color: green"] [Html.text "Tjena2, ", Html.b [] [Html.text "elmx!"]]]
    name = "Homer"
    placelist = [ "Bart", "List", "Maggie" ]
    lis = map (\s -> Html.li [Html.Attributes.attribute "class" "collection-item"] [Html.text s]) placelist
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
