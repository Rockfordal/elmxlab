module Views.Items exposing (..)

import Types exposing (..)
import Html  exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import List exposing (map)


itemrow : Item -> Html Msg
itemrow item =
  Html.div [] [
    Html.div [Html.Attributes.attribute "class" "card"] [
      Html.div [Html.Attributes.attribute "class" "input-field col col l5 m4 s4", Html.Attributes.attribute "id" "hylla 1"] [
        Html.input [Html.Attributes.attribute "disabled" "true", Html.Attributes.attribute "value" (item.name), Html.Attributes.attribute "id" "disabled", Html.Attributes.attribute "type" "text", Html.Attributes.attribute "class" "validate"] []
        , Html.label [Html.Attributes.attribute "for" "disabled"] [Html.text "Namn"]
      ]
      , Html.div [Html.Attributes.attribute "class" "input-field col col l5 m4 s4"] [
        Html.input [Html.Attributes.attribute "disabled" "true", Html.Attributes.attribute "value" (item.info), Html.Attributes.attribute "id" "disabled", Html.Attributes.attribute "type" "text", Html.Attributes.attribute "class" "validate"] []
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
-- Html.a [Html.Attributes.attribute "href" "#", Html.Events.onClick (DeleteItem item.id)] [ Html.i [Html.Attributes.attribute "class" "small material-icons"] [Html.text "delete"] ]


items : Model -> Html Msg
items model =
  let
     items = map itemrow model.items
  in
    Html.div [Html.Attributes.attribute "class" "container"] [
      Html.h3 [] [Html.text "Items"]
      , Html.div [Html.Attributes.attribute "class" "row"] ([ ] ++ items ++ [ ])
        , Html.a [Html.Attributes.attribute "href" "#", Html.Events.onClick (Alerta "Tjo")] [Html.text "Alert"]
    ]
