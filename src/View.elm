module View exposing (..)

import Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Views.Layout exposing (..)
import Views.Shelfs exposing (..)
import Views.Items exposing (..)
-- import Views.Raw exposing (shelfitem, menyitem)


view : Model -> Html Msg
view model =
  let
      a = 1
      -- menyer = List.map (menyitem model.shelf) model.shelfs
  in
    Html.div [] [
      navview model
        , Html.div [Html.Attributes.attribute "class" "container"] [
              Html.a [Html.Attributes.attribute "class" "fixed-action-btn", Html.Attributes.attribute "style" "bottom: 15px; right: 10px;"] [Html.a [Html.Attributes.attribute "class" "btn-floating btn-large teal darken-4"] [
                Html.i [Html.Attributes.attribute "class" "large material-icons"] [Html.text "add"]
              ]
      ]]
        , shelfsview model
        , itemsview model
    ]
