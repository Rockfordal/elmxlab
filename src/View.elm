module View exposing (..)
import Types exposing (Post, Model, Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import List exposing (map)

-- link : Post -> Html Msg
-- link post =
--   Html.li [] [Html.a [Html.Attributes.attribute "href" "#!"] [Html.text  post.title ]]

menuitem : Post -> Html Msg
menuitem post =
  let
    aktivklass = "active"
  in
  Html.li [Html.Attributes.attribute "class" aktivklass] [
    Html.a [Html.Attributes.attribute "href" "#", Html.Events.onClick ( SetPost post.id )] [Html.text  post.title]
  ]

postcontentz : Post -> Html Msg
postcontentz post =
  Html.div [Html.Attributes.attribute "class" "row"] [
        Html.div [Html.Attributes.attribute "class" "col s12 m6"] [
          Html.div [Html.Attributes.attribute "class" "card blue-grey darken-1"] [
            Html.div [Html.Attributes.attribute "class" "card-content white-text"] [
              Html.span [Html.Attributes.attribute "class" "card-title"] [Html.text  post.title]
              , Html.p [] [Html.text  post.content]
            ]
            , Html.div [Html.Attributes.attribute "class" "card-action"] [
              Html.a [Html.Attributes.attribute "href" "#"] [Html.text "This is a link"]
              , Html.a [Html.Attributes.attribute "href" "#"] [Html.text "This is a link"]
            ]
          ]
        ]
      ]


view : Model -> Html Msg
view model =
  let
    posts = (List.map menuitem model.posts)
    postcontent = [postcontentz model.post]
  in
  Html.div [] [
    Html.nav [] [
    Html.div [Html.Attributes.attribute "class" "nav-wrapper"] [
      Html.a [Html.Attributes.attribute "href" "#!", Html.Attributes.attribute "class" "brand-logo"] [Html.text "Logo"]
      , Html.a [Html.Attributes.attribute "href" "#", Html.Attributes.attribute "data-activates" "mobile-demo", Html.Attributes.attribute "class" "button-collapse"] [Html.i [Html.Attributes.attribute "class" "material-icons"] [Html.text "menu"]]
      , Html.ul [Html.Attributes.attribute "id" "slide-out", Html.Attributes.attribute "class" "side-nav fixed"] ([
      ] ++ posts ++ [
      Html.li [] [Html.a [Html.Attributes.attribute "href" "#"] [Html.text "Hoho"]]

    ])
    , Html.a [Html.Attributes.attribute "href" "#", Html.Attributes.attribute "data-activates" "slide-out", Html.Attributes.attribute "class" "button-collapse"] [Html.i [Html.Attributes.attribute "class" "mdi-navigation-menu"] []]
      , Html.ul [Html.Attributes.attribute "class" "side-nav", Html.Attributes.attribute "id" "mobile-demo"] [
        Html.li [] [Html.a [Html.Attributes.attribute "href" "sass.html"] [Html.text "Projekt"]]
        , Html.li [] [Html.a [Html.Attributes.attribute "href" "collapsible.html"] [Html.text "Länkar"]]
      ]
    ]
  ]
    , Html.div [Html.Attributes.attribute "class" "row"] [
      Html.div [Html.Attributes.attribute "class" "col l6 offset-l3"] [
        Html.div [] postcontent
        , Html.button [Html.Attributes.attribute "class" "btn red", Html.Events.onClick Pang] [Html.text "radera", Html.i [Html.Attributes.attribute "class" "large material-icons"] [Html.text "delete"]]
      ]
    ]
  ]
