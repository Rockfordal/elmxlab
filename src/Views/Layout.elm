module Views.Layout exposing (..)

import Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)


navview : Model -> Html Msg
navview model =
  Html.nav [] [
    Html.div [Html.Attributes.attribute "class" "nav-wrapper brown darken-2"] [
      Html.a [Html.Attributes.attribute "href" "#!", Html.Attributes.attribute "class" "brand-logo"] [Html.text "Nice Rack"]
      , Html.a [Html.Attributes.attribute "href" "#", Html.Attributes.attribute "data-activates" "mobile-demo", Html.Attributes.attribute "class" "button-collapse"] [Html.i [Html.Attributes.attribute "class" "material-icons"] [Html.text "menu"]]
      , Html.ul [Html.Attributes.attribute "id" "slide-out", Html.Attributes.attribute "class" "side-nav"] [
      ]
      , Html.a [Html.Attributes.attribute "href" "#", Html.Attributes.attribute "data-activates" "slide-out", Html.Attributes.attribute "class" "button-collapse"] [Html.i [Html.Attributes.attribute "class" "mdi-navigation-menu"] []]
      , Html.ul [Html.Attributes.attribute "class" "side-nav", Html.Attributes.attribute "id" "mobile-demo"] [
      ]
    ]
  ]
