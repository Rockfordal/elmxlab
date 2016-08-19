module Views.Shelfs exposing (..)

import Types exposing (..)
import Html  exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import List exposing (map)


shelfrow : Shelf -> Html Msg
shelfrow shelf =
  let nameid = "name" ++ (toString shelf.id)
      sizeid = "size" ++ (toString shelf.id)
  in
    Html.div [] [
      Html.div [Html.Attributes.attribute "class" "card"] [
        Html.div [Html.Attributes.attribute "class" "input-field col l5 m4 s4"] [
          Html.input [Html.Attributes.attribute "value" (shelf.label), Html.Attributes.attribute "id" (nameid), Html.Attributes.attribute "type" "text", Html.Attributes.attribute "class" "validate"] []
          , Html.label [Html.Attributes.attribute "for" (nameid)] [Html.text "Namn"]
        ]
        , Html.div [Html.Attributes.attribute "class" "input-field col l5 m4 s4"] [
          Html.input [Html.Attributes.attribute "value" (toString shelf.size), Html.Attributes.attribute "id" (sizeid), Html.Attributes.attribute "type" "text", Html.Attributes.attribute "class" "validate"] []
          , Html.label [Html.Attributes.attribute "for" (sizeid)] [Html.text "Storlek"]
        ]
          , Html.div [Html.Attributes.attribute "class" "input-field col l1 m2 s2"] [
            Html.i [Html.Attributes.attribute "class" "small material-icons"] [Html.text "mode_edit"]
          ]
          , Html.div [Html.Attributes.attribute "class" "input-field col l1 m2 s2"] [
            Html.a [Html.Attributes.attribute "href" "#", Html.Events.onClick (DeleteShelf shelf.id)] [ Html.i [Html.Attributes.attribute "class" "small material-icons"] [Html.text "delete"] ]
          ]
      ]
    ]


shelfs : Model -> Html Msg
shelfs model =
  let
     shelfs = map shelfrow model.shelfs
  in
    Html.div [Html.Attributes.attribute "class" "container"] [
      Html.h3 [] [Html.text "Hyller"]
      , Html.div [Html.Attributes.attribute "class" "row"] ([
        ] ++ shelfs ++ [
        addButton
      ])
        , Html.br [] []
        , Html.a [Html.Attributes.attribute "href" "#", Html.Events.onClick (FormFix)] [Html.text "Formfix"]
    ]


addButton : Html Msg
addButton =
  Html.div [] [
    Html.a [Html.Attributes.attribute "href" "#", Html.Events.onClick (CreateShelf), Html.Attributes.attribute "class" "btn-floating btn-large teal darken-4"] [
      Html.i [Html.Attributes.attribute "class" "large material-icons"] [Html.text "add"]
    ]
  ]

  -- Html.a [Html.Attributes.attribute "class" "fixed-action-btn", Html.Attributes.attribute "style" "bottom: 15px; right: 10px;"] [Html.text "
  -- "]
