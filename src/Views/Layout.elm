module Views.Layout exposing (..)

import Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)

navlinks : Html Msg
navlinks =
  Html.div [] [
    Html.li [] [Html.a [Html.Attributes.attribute "href" "#"] [Html.text "Hyllor"]]
    , Html.li [] [Html.a [Html.Attributes.attribute "href" "#"] [Html.text "Items"]]
  ]

navview : Model -> Html Msg
navview model =
  Html.nav [] [
    Html.div [Html.Attributes.attribute "class" "nav-wrapper brown darken-2"] [
      Html.a [Html.Attributes.attribute "href" "#!", Html.Attributes.attribute "class" "brand-logo"] [Html.text "Nice Rack"]
      , Html.a [Html.Attributes.attribute "href" "#", Html.Attributes.attribute "data-activates" "mobile-demo", Html.Attributes.attribute "class" "button-collapse"] [Html.i [Html.Attributes.attribute "class" "material-icons"] [Html.text "menu"]]
      , Html.ul [Html.Attributes.attribute "class" "right hide-on-med-and-down"] [
        navlinks
      ]
      , Html.ul [Html.Attributes.attribute "class" "side-nav", Html.Attributes.attribute "id" "mobile-demo"] [
        navlinks
      ]
    ]
  ]
