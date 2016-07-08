module View exposing (..)
import Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Viewmini exposing (shelfitem, menyitem)


view : Model -> Html Msg
view model =
  let
    menyer = List.map (menyitem model.shelf) model.shelfs
    -- tid = toString model.interval
  in
    Html.div [] [
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
        , Html.div [Html.Attributes.attribute "class" "container"] [
          Html.div [Html.Attributes.attribute "class" "row"] [
            Html.div [Html.Attributes.attribute "class" "collection"] [
              Html.div [Html.Attributes.attribute "class" "card"] [
                Html.div [Html.Attributes.attribute "class" "input-field col col l5 m4 s4", Html.Attributes.attribute "id" "hylla 1"] [
                  Html.input [Html.Attributes.attribute "disabled" "true", Html.Attributes.attribute "value" "A01", Html.Attributes.attribute "id" "disabled", Html.Attributes.attribute "type" "text", Html.Attributes.attribute "class" "validate"] []
                  , Html.label [Html.Attributes.attribute "for" "disabled"] [Html.text "Namn"]
                ]
                , Html.div [Html.Attributes.attribute "class" "input-field col col l5 m4 s4"] [
                  Html.input [Html.Attributes.attribute "disabled" "true", Html.Attributes.attribute "value" "20", Html.Attributes.attribute "id" "disabled", Html.Attributes.attribute "type" "text", Html.Attributes.attribute "class" "validate"] []
                  , Html.label [Html.Attributes.attribute "for" "disabled"] [Html.text "Storlek"]
                ]
              ]
              , Html.div [Html.Attributes.attribute "class" "input-field col l1 m2 s2"] [
                Html.i [Html.Attributes.attribute "class" "small material-icons"] [Html.text "mode_edit"]
              ]
              , Html.div [Html.Attributes.attribute "class" "input-field col l1 m2 s2"] [
                Html.i [Html.Attributes.attribute "class" "small material-icons"] [Html.text "delete"]
              ]
          ]
            , Html.div [Html.Attributes.attribute "class" "collection"] [
              Html.div [Html.Attributes.attribute "class" "card"] [
                Html.div [Html.Attributes.attribute "class" "input-field col l5 m4 s4", Html.Attributes.attribute "id" "hylla 2"] [
                  Html.input [Html.Attributes.attribute "disabled" "true", Html.Attributes.attribute "value" "A02", Html.Attributes.attribute "id" "disabled", Html.Attributes.attribute "type" "text", Html.Attributes.attribute "class" "validate"] []
                  , Html.label [Html.Attributes.attribute "for" "disabled"] [Html.text "Namn"]
                ]
                  , Html.div [Html.Attributes.attribute "class" "input-field col l5 m4 s4"] [
                    Html.input [Html.Attributes.attribute "disabled" "true", Html.Attributes.attribute "value" "10", Html.Attributes.attribute "id" "disabled", Html.Attributes.attribute "type" "text", Html.Attributes.attribute "class" "validate"] []
                    , Html.label [Html.Attributes.attribute "for" "disabled"] [Html.text "Storlek"]
                  ]
              ]
                  , Html.div [Html.Attributes.attribute "class" "input-field col l1 m2 s2"] [
                    Html.i [Html.Attributes.attribute "class" "small material-icons"] [Html.text "mode_edit"]
                  ]
                  , Html.div [Html.Attributes.attribute "class" "input-field col l1 m2 s2"] [
                    Html.i [Html.Attributes.attribute "class" "small material-icons"] [Html.text "delete"]
                  ]
            ]
            ]
              , Html.a [Html.Attributes.attribute "class" "fixed-action-btn", Html.Attributes.attribute "style" "bottom: 45px; right: 24px;"] [Html.a [Html.Attributes.attribute "class" "btn-floating btn-large teal darken-4"] [
                Html.i [Html.Attributes.attribute "class" "large material-icons"] [Html.text "add"]
              ]
      ]]
    ]
