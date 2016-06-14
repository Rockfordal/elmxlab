module View exposing (..)
import Types exposing (Post, Model, Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import List exposing (map)
--
-- navbar : Model -> Html Msg
-- navbar model =
--   -- let
--   -- => Html.script [] [Html.text "$( document ).ready(function()", 
--   -- $(".button-collapse").sideNav();
--   -- , Html.text ")"]
--   -- in
--     Html.div [] [Html.text "
--       ", Html.nav [] [Html.text "
--         ", Html.div [Html.Attributes.attribute "class" "nav-wrapper"] [Html.text "
--           ", Html.a [Html.Attributes.attribute "href" "#!", Html.Attributes.attribute "class" "brand-logo"] [Html.text "Logo"], Html.text "
--           ", Html.a [Html.Attributes.attribute "href" "#", Html.Attributes.attribute "data-activates" "mobile-demo", Html.Attributes.attribute "class" "button-collapse"] [Html.i [Html.Attributes.attribute "class" "material-icons"] [Html.text "menu"]], Html.text "
--           ", Html.ul [Html.Attributes.attribute "class" "right hide-on-med-and-down"] [Html.text "
--             ", Html.li [] [Html.a [Html.Attributes.attribute "href" "sass.html"] [Html.text "Sass"]], Html.text "
--             ", Html.li [] [Html.a [Html.Attributes.attribute "href" "badges.html"] [Html.text "Components"]], Html.text "
--             ", Html.li [] [Html.a [Html.Attributes.attribute "href" "collapsible.html"] [Html.text "Javascript"]], Html.text "
--             ", Html.li [] [Html.a [Html.Attributes.attribute "href" "mobile.html"] [Html.text "Mobile"]], Html.text "
--           "], Html.text "
--           ", Html.ul [Html.Attributes.attribute "class" "side-nav", Html.Attributes.attribute "id" "mobile-demo"] [Html.text "
--             ", Html.li [] [Html.a [Html.Attributes.attribute "href" "sass.html"] [Html.text "Sass"]], Html.text "
--             ", Html.li [] [Html.a [Html.Attributes.attribute "href" "badges.html"] [Html.text "Components"]], Html.text "
--             ", Html.li [] [Html.a [Html.Attributes.attribute "href" "collapsible.html"] [Html.text "Javascript"]], Html.text "
--             ", Html.li [] [Html.a [Html.Attributes.attribute "href" "mobile.html"] [Html.text "Mobile"]], Html.text "
--           "], Html.text "
--         "], Html.text "
--       "], Html.text "
--     "]
post : Post -> Html Msg
post post =
  Html.div [Html.Attributes.attribute "class" "row"] [
    Html.div [Html.Attributes.attribute "class" "col l6 offset-l3 card"] [
      Html.div [Html.Attributes.attribute "class" "card-content"] [
        Html.span [Html.Attributes.attribute "class" "card-title"] [Html.text  post.title]
        , Html.p [] [Html.text  post.content]
      ]
      , Html.div [Html.Attributes.attribute "class" "card-action"] [
        Html.a [Html.Attributes.attribute "href" "#"] [Html.text "This is a link"]
        , Html.a [Html.Attributes.attribute "href" "#"] [Html.text "This is a link"]
      ]
    ]
  ]

-- lab : Model -> Html Msg
-- lab model =
--   let
--     hello = Html.h1 [] [Html.span [Html.Attributes.attribute "style" "color: green"] [Html.text "Tjena5, ", Html.b [] [Html.text "elmx!"]]]
--     name = "Homer"
--     placelist = [ "Bart", "List", "Maggie" ]
--     lis = map (\s -> Html.li [Html.Attributes.attribute "class" "collection-item"] [Html.text s]) placelist
--     commonAttrs =
--       [ title "common title"
--       , align "left"
--       ]
--   in
--     Html.div [] [Html.text "
--       ", Html.div ([Html.Attributes.attribute "class" "container"] ++ commonAttrs) [Html.text "
--         ", hello, Html.text "
--         ", Html.p [] [Html.a [Html.Attributes.attribute "class" "waves-effect waves-light btn"] [Html.text "button"]], Html.text "
--         ", Html.text name, Html.text " is the father of:
--         ", Html.ul [Html.Attributes.attribute "class" "collection"] lis, Html.text "
--       "], Html.text "
--   "]
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
        Html.li [] [Html.a [Html.Attributes.attribute "href" "sass.html"] [Html.text "Sass"]]
        , Html.li [] [Html.a [Html.Attributes.attribute "href" "badges.html"] [Html.text "Components"]]
        , Html.li [] [Html.a [Html.Attributes.attribute "href" "collapsible.html"] [Html.text "Javascript"]]
        , Html.li [] [Html.a [Html.Attributes.attribute "href" "mobile.html"] [Html.text "Mobile"]]
      ]
      , Html.ul [Html.Attributes.attribute "class" "side-nav", Html.Attributes.attribute "id" "mobile-demo"] [
        Html.li [] [Html.a [Html.Attributes.attribute "href" "sass.html"] [Html.text "Sass"]]
        , Html.li [] [Html.a [Html.Attributes.attribute "href" "badges.html"] [Html.text "Components"]]
        , Html.li [] [Html.a [Html.Attributes.attribute "href" "collapsible.html"] [Html.text "Javascript"]]
        , Html.li [] [Html.a [Html.Attributes.attribute "href" "mobile.html"] [Html.text "Mobile"]]
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
