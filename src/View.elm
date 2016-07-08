module View exposing (..)
import Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Viewmini exposing (shelfitem, menyitem)
import Views.Items exposing (..)
import Views.Shelfs exposing (..)


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
              Html.a [Html.Attributes.attribute "class" "fixed-action-btn", Html.Attributes.attribute "style" "bottom: 15px; right: 10px;"] [Html.a [Html.Attributes.attribute "class" "btn-floating btn-large teal darken-4"] [
                Html.i [Html.Attributes.attribute "class" "large material-icons"] [Html.text "add"]
              ]
      ]]
        , shelfsview model
        , itemsview model
    ]
