module Views.Shelfs exposing (..)
import Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


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
          Html.a [Html.Attributes.attribute "href" "#", Html.Events.onClick (DeleteShelf shelf.id)] [ Html.i [Html.Attributes.attribute "class" "small material-icons"] [Html.text "delete"] ]
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
      addButton
    ])
  ]

addButton : Html Msg
addButton =
  Html.div [] [
    Html.a [Html.Attributes.attribute "href" "#", Html.Events.onClick CreateShelf, Html.Attributes.attribute "class" "btn-floating btn-large teal darken-4"] [
      Html.i [Html.Attributes.attribute "class" "large material-icons"] [Html.text "add"]
    ]
  ]

  -- Html.a [Html.Attributes.attribute "class" "fixed-action-btn", Html.Attributes.attribute "style" "bottom: 15px; right: 10px;"] [Html.text "
  -- "]
