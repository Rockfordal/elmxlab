module View exposing (..)
import Types exposing (Post, Model, Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import List exposing (map)


post : Post -> Html Msg
post post =
  Html.div [Html.Attributes.attribute "class" "row"] [
    Html.div [Html.Attributes.attribute "class" "col l6 offset-l3 card"] [
      Html.div [Html.Attributes.attribute "class" "card-content"] [
        Html.span [Html.Attributes.attribute "class" "card-title"] [Html.text  post.title]
        , Html.p [] [Html.text  post.content]
      ]
      , Html.div [Html.Attributes.attribute "class" "card-action"] [
        Html.a [Html.Attributes.attribute "href" "#"] [Html.text "Citroner"]
        , Html.a [Html.Attributes.attribute "href" "#"] [Html.text "Bananer"]
      ]
    ]
  ]


view : Model -> Html Msg
view model =
  let
  posts = (List.map (post) model.posts)
  in
  Html.div [] ([
    Html.nav [] [
    Html.div [Html.Attributes.attribute "class" "nav-wrapper"] [
      Html.a [Html.Attributes.attribute "href" "#!", Html.Attributes.attribute "class" "brand-logo"] [Html.text "Logo"]
      , Html.a [Html.Attributes.attribute "href" "#", Html.Attributes.attribute "data-activates" "mobile-demo", Html.Attributes.attribute "class" "button-collapse"] [Html.i [Html.Attributes.attribute "class" "material-icons"] [Html.text "menu"]]
      , Html.ul [Html.Attributes.attribute "class" "right hide-on-med-and-down"] [
        Html.li [] [Html.a [Html.Attributes.attribute "href" "sass.html"] [Html.text "Projekt"]]
        , Html.li [] [Html.a [Html.Attributes.attribute "href" "collapsible.html"] [Html.text "Länkar"]]
      ]
      , Html.ul [Html.Attributes.attribute "class" "side-nav", Html.Attributes.attribute "id" "mobile-demo"] [
        Html.li [] [Html.a [Html.Attributes.attribute "href" "sass.html"] [Html.text "Projekt"]]
        , Html.li [] [Html.a [Html.Attributes.attribute "href" "collapsible.html"] [Html.text "Länkar"]]
      ]
    ]
  ]
      ] ++ posts ++ [
    Html.div [Html.Attributes.attribute "class" "row"] [
      Html.div [Html.Attributes.attribute "class" "col l6 offset-l3"] [
        Html.button [Html.Attributes.attribute "class" "btn red", Html.Events.onClick Pang] [Html.text "radera", Html.i [Html.Attributes.attribute "class" "large material-icons"] [Html.text "delete"]]
      ]
    ]
  ])
