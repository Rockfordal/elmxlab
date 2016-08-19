module Views.View exposing (..) -- (view)

import Html exposing (..)
import Html.Attributes exposing (..) -- (href)
import Routes exposing (Sitemap(..))
import Types  exposing (Model, Msg(..))
import Views.Shelfs exposing (shelfsview)
import Views.Items  exposing (itemsview)
import Views.Home   exposing (..)
import Views.Navbar exposing (viewNavbar)
-- import Html.Events exposing (on, targetValue, onClick, onInput, onSubmit, onWithOptions)
-- import Json.Decode as Json
-- import Debug  exposing (log)
-- import Views.Layout exposing (..)
-- import Item.View exposing (viewItems)
-- import Item.Views.AddModal exposing (addItemModal)
-- import Item.Views.EditModal exposing (editItemModal)


view : Model -> Html Msg
view model =
    let
        navBar = viewNavbar
    in
        div []
            [ navBar
            , div [ class "container"]
                  [
                    case model.route of
                      HomeR  () -> home model
                      ShelfR () -> shelfsview model
                      ItemR ()  -> itemsview model
                      AboutR () -> about
                      NotFoundR -> notFound
                ]
            ]

notFound : Html Msg
notFound = h1 [] [ text "Sidan hittades inte" ]


about :Html Msg
about = h1 [] [ text "Om mig" ]
