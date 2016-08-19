module Views.Navbar exposing (..)

import Html exposing (Html, div, text, ul, li, a, i, nav)
import Html.Attributes exposing (class, href, attribute, id)
import Html.Events exposing (on, targetValue, onClick, onInput, onSubmit, onWithOptions)
import Types exposing (Msg(..))
import Routes exposing (Sitemap(..))
import Json.Decode as Json


link : Sitemap -> String -> Html Msg
link route label =
    let
        opts = { preventDefault  = True
               , stopPropagation = False
               }
    in
        a [ href (Routes.toString route)
          , onWithOptions "click" opts (Json.succeed <| RouteTo route)
          ]
          [ text label ]


navbar : Html Msg
navbar =
  div []
      [ ul [ class "dropdown-content", id "dropdown0" ]
          [ li [] [ link (HomeR ()) "Användare" ]
          , li [] [ link (HomeR ()) "Inställningar" ]
          , li [ class "divider" ] []
          , li [] [ link (HomeR ()) "Logga in" ]
          ]
      , nav []
          [ div [ class "nav-wrapper" ]
              [ a [ class "brand-logo", href (Routes.toString (HomeR ())) ]
                  [ text "GrELMthinkDB" ]
              , ul [ class "right hide-on-med-and-down" ]
                  [
                    li [] [ link (ShelfR ()) "Hyllor" ]
                  , li [] [ link (ItemR  ()) "Föremål" ]
                  , li [] [ link (AboutR ()) "About" ]
                  , li []
                      [ a [ class "dropdown-button", attribute "data-activates" "dropdown0", href "#!" ]
                          [ text "Admin"
                          , i [ class "material-icons right" ]
                              [ text "arrow_drop_down" ] ] ] ] ] ] ]
