module View exposing (..)
import Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Viewmini exposing (postitem, menyitem)


view : Model -> Html Msg
view model =
  let
    menyer = List.map (menyitem model.post) model.posts
    postcontent = postitem model.post
    -- tid = toString model.interval
  in
    Html.div [] [
      Html.nav [] [
        Html.div [Html.Attributes.attribute "class" "nav-wrapper"] [
          Html.a [Html.Attributes.attribute "href" "#!", Html.Attributes.attribute "class" "brand-logo"] [Html.text "Logo"]
          , Html.a [Html.Attributes.attribute "href" "#", Html.Attributes.attribute "data-activates" "mobile-demo", Html.Attributes.attribute "class" "button-collapse"] [Html.i [Html.Attributes.attribute "class" "material-icons"] [Html.text "menu"]]
          , Html.ul [Html.Attributes.attribute "id" "slide-out", Html.Attributes.attribute "class" "side-nav fixed"] ([
            ] ++ menyer ++ [
          ])
          , Html.a [Html.Attributes.attribute "href" "#", Html.Attributes.attribute "data-activates" "slide-out", Html.Attributes.attribute "class" "button-collapse"] [Html.i [Html.Attributes.attribute "class" "mdi-navigation-menu"] []]
          , Html.ul [Html.Attributes.attribute "class" "side-nav", Html.Attributes.attribute "id" "mobile-demo"] ([
            ] ++ menyer ++ [
          ])
        ]
      ]

      , Html.div [Html.Attributes.attribute "class" "row"] [
        Html.div [Html.Attributes.attribute "class" "col l6 offset-l3"] [
          postcontent
        ]
      ]
    ]


          -- {= (toString model.counter) }
          -- Html.br [] []
          -- {= (toString model.postindex) }
