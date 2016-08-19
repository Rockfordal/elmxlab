module Views.View exposing (..) -- (view)

import Html            exposing (..)
import Html.Attributes exposing (..) -- (href)
import Routes          exposing (Sitemap(..))
import Types           exposing (Model, Msg(..))
import Views.Shelfs    exposing (shelfsview)
import Views.Items     exposing (itemsview)
import Views.Home      exposing (..)
import Views.Navbar    exposing (viewNavbar)


setView : Model -> Html Msg
setView model  =
 case model.route of
    HomeR  () -> home model
    ShelfR () -> shelfsview model
    ItemR ()  -> itemsview model
    AboutR () -> about
    NotFoundR -> notFound


view : Model -> Html Msg
view model =
  div []
      [ viewNavbar
      , div [ class "container"]
            [ setView model ]
      ]


notFound : Html Msg
notFound = h1 [] [ text "Sidan hittades inte" ]


about :Html Msg
about = h1 [] [ text "Om mig" ]
