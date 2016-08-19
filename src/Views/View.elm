module Views.View exposing (..) -- (view)

import Html            exposing (..)
import Html.Attributes exposing (..) -- (href)
import Routes          exposing (Sitemap(..))
import Types           exposing (Model, Msg(..))
import Views.Home      exposing (home)
import Views.Shelfs    exposing (shelfs)
import Views.Items     exposing (items)
import Views.Navbar    exposing (navbar)


setView : Model -> Html Msg
setView model =
  case model.route of
    HomeR  () -> home   model
    ShelfR () -> shelfs model
    ItemR  () -> items  model
    AboutR () -> about
    NotFoundR -> notFound


view : Model -> Html Msg
view model =
  div []
      [ navbar
      , div [ class "container"]
            [ setView model ]
      ]


notFound : Html Msg
notFound = h1 [] [ text "Sidan hittades inte" ]


about :Html Msg
about = h1 [] [ text "Om mig" ]
