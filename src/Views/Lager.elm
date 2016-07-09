module Views.Lager exposing (..)

import Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Views.Layout exposing (..)
import Views.Shelfs exposing (..)
import Views.Items exposing (..)
-- import Views.Raw exposing (shelfitem, menyitem)


lagerview : Model -> Html Msg
lagerview model =
  let
      a = 1
      -- menyer = List.map (menyitem model.shelf) model.shelfs
  in
    Html.div [] [
      navview model
      , shelfsview model
      , itemsview model
    ]
