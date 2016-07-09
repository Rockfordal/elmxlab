module Views.Shelfs exposing (..)
import Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)

shelfview : Shelf -> Html Msg
shelfview shelf =
  Html.div [] [
    Html.div [Html.Attributes.attribute "class" "card"] [
      Html.div [Html.Attributes.attribute "class" "input-field col col l5 m4 s4", Html.Attributes.attribute "id" "hylla 1"] [
        Html.input [Html.Attributes.attribute "disabled" "true", Html.Attributes.attribute "value" shelf.name, Html.Attributes.attribute "id" "disabled", Html.Attributes.attribute "type" "text", Html.Attributes.attribute "class" "validate"] []
        , Html.label [Html.Attributes.attribute "for" "disabled"] [Html.text "Namn"]
      ]
      , Html.div [Html.Attributes.attribute "class" "input-field col col l5 m4 s4"] [
        Html.input [Html.Attributes.attribute "disabled" "true", Html.Attributes.attribute "value" (toString shelf.size), Html.Attributes.attribute "id" "disabled", Html.Attributes.attribute "type" "text", Html.Attributes.attribute "class" "validate"] []
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

shelfsview : Model -> Html Msg
shelfsview model =
  let
     shelfs = List.map shelfview model.shelfs
  in
  Html.div [Html.Attributes.attribute "class" "container"] [
    Html.h3 [] [Html.text "Hyller"]
          , Html.div [Html.Attributes.attribute "class" "row"] ([
            ] ++ shelfs ++ [
          ])
      ]

-- gammla : Html Msg
-- gammla =
--   Html.div [Html.Attributes.attribute "class" "row"] [Html.text "
--             ", Html.div [Html.Attributes.attribute "class" "collection"] [Html.text "
--               ", Html.div [Html.Attributes.attribute "class" "card"] [Html.text "
--                 ", Html.div [Html.Attributes.attribute "class" "input-field col col l5 m4 s4", Html.Attributes.attribute "id" "hylla 1"] [Html.text "
--                   ", Html.input [Html.Attributes.attribute "disabled" "true", Html.Attributes.attribute "value" "A01", Html.Attributes.attribute "id" "disabled", Html.Attributes.attribute "type" "text", Html.Attributes.attribute "class" "validate"] [], Html.text "
--                   ", Html.label [Html.Attributes.attribute "for" "disabled"] [Html.text "Namn"], Html.text "
--                 "], Html.text "
--                 ", Html.div [Html.Attributes.attribute "class" "input-field col col l5 m4 s4"] [Html.text "
--                   ", Html.input [Html.Attributes.attribute "disabled" "true", Html.Attributes.attribute "value" "20", Html.Attributes.attribute "id" "disabled", Html.Attributes.attribute "type" "text", Html.Attributes.attribute "class" "validate"] [], Html.text "
--                   ", Html.label [Html.Attributes.attribute "for" "disabled"] [Html.text "Storlek"], Html.text "
--                 "], Html.text "
--               "], Html.text "
--               ", Html.div [Html.Attributes.attribute "class" "input-field col l1 m2 s2"] [Html.text "
--                 ", Html.i [Html.Attributes.attribute "class" "small material-icons"] [Html.text "mode_edit"], Html.text "
--               "], Html.text "
--               ", Html.div [Html.Attributes.attribute "class" "input-field col l1 m2 s2"] [Html.text "
--                 ", Html.i [Html.Attributes.attribute "class" "small material-icons"] [Html.text "delete"], Html.text "
--               "], Html.text "
--           "], Html.text "
--             ", Html.div [Html.Attributes.attribute "class" "collection"] [Html.text "
--               ", Html.div [Html.Attributes.attribute "class" "card"] [Html.text "
--                 ", Html.div [Html.Attributes.attribute "class" "input-field col l5 m4 s4", Html.Attributes.attribute "id" "hylla 2"] [Html.text "
--                   ", Html.input [Html.Attributes.attribute "disabled" "true", Html.Attributes.attribute "value" "A02", Html.Attributes.attribute "id" "disabled", Html.Attributes.attribute "type" "text", Html.Attributes.attribute "class" "validate"] [], Html.text "
--                   ", Html.label [Html.Attributes.attribute "for" "disabled"] [Html.text "Namn"], Html.text "
--                 "], Html.text "
--                   ", Html.div [Html.Attributes.attribute "class" "input-field col l5 m4 s4"] [Html.text "
--                     ", Html.input [Html.Attributes.attribute "disabled" "true", Html.Attributes.attribute "value" "10", Html.Attributes.attribute "id" "disabled", Html.Attributes.attribute "type" "text", Html.Attributes.attribute "class" "validate"] [], Html.text "
--                     ", Html.label [Html.Attributes.attribute "for" "disabled"] [Html.text "Storlek"], Html.text "
--                   "], Html.text "
--               "], Html.text "
--                   ", Html.div [Html.Attributes.attribute "class" "input-field col l1 m2 s2"] [Html.text "
--                     ", Html.i [Html.Attributes.attribute "class" "small material-icons"] [Html.text "mode_edit"], Html.text "
--                   "], Html.text "
--                   ", Html.div [Html.Attributes.attribute "class" "input-field col l1 m2 s2"] [Html.text "
--                     ", Html.i [Html.Attributes.attribute "class" "small material-icons"] [Html.text "delete"], Html.text "
--                   "], Html.text "
--             "], Html.text "
--         "]
-- 
