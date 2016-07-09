module Views.View exposing (..) -- (view)

import Html exposing (..)
import Html.Attributes exposing (..) -- (href)
import Html.Events exposing (on, targetValue, onClick, onInput, onSubmit, onWithOptions)
import Json.Decode as Json
import Routes exposing (Sitemap(..))
import Types exposing (Model, Msg(..))
import Debug exposing (log)
import Views.Shelfs exposing (shelfsview)
import Views.Items exposing (itemsview)
import Views.Home exposing (..)
import Views.Navbar exposing (viewNavbar)
-- import Views.Layout exposing (..)
-- import Item.View exposing (viewItems)
-- import Item.Views.AddModal exposing (addItemModal)
-- import Item.Views.EditModal exposing (editItemModal)


notFound : Html Msg
notFound =
    h1 [] [ text "Page not found" ]

about : Model -> Html Msg
about model =
    h1 [] [ text "About mig" ]

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
                      HomeR ()  -> home model
                      AboutR () -> about model
                      ShelfR () -> shelfsview model
                      ItemR ()  -> itemsview model
                      NotFoundR -> notFound
                ]
            ]
