module Views.Items exposing (..)
import Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)

itemview : Model -> Html Msg
itemview model =
  Html.div [] [
    Html.div [Html.Attributes.attribute "class" "card"] [
      Html.div [Html.Attributes.attribute "class" "input-field col col l5 m4 s4", Html.Attributes.attribute "id" "hylla 1"] [
        Html.input [Html.Attributes.attribute "disabled" "true", Html.Attributes.attribute "value" "A01", Html.Attributes.attribute "id" "disabled", Html.Attributes.attribute "type" "text", Html.Attributes.attribute "class" "validate"] []
        , Html.label [Html.Attributes.attribute "for" "disabled"] [Html.text "Namn"]
      ]
      , Html.div [Html.Attributes.attribute "class" "input-field col col l5 m4 s4"] [
        Html.input [Html.Attributes.attribute "disabled" "true", Html.Attributes.attribute "value" "20", Html.Attributes.attribute "id" "disabled", Html.Attributes.attribute "type" "text", Html.Attributes.attribute "class" "validate"] []
        , Html.label [Html.Attributes.attribute "for" "disabled"] [Html.text "Storlek"]
      ]
        , Html.div [Html.Attributes.attribute "class" "input-field col l1 m2 s2"] [
          Html.i [Html.Attributes.attribute "class" "small material-icons"] [Html.text "mode_edit"]
        ]
        , Html.div [Html.Attributes.attribute "class" "input-field col l1 m2 s2"] [
          Html.i [Html.Attributes.attribute "class" "small material-icons"] [Html.text "delete"]
        ]
    ]
  ]

itemsview : Model -> Html Msg
itemsview model =
  Html.div [Html.Attributes.attribute "class" "container"] [
    Html.h3 [] [Html.text "Items"]
          , Html.div [Html.Attributes.attribute "class" "row"] [
            itemview model
          ]
      ]
