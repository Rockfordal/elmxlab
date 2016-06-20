module View exposing (..)
import Types exposing (Model, Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
-- import List exposing (map)


-- link : Post -> Html Msg
-- link post =
--   Html.li [] [Html.a [Html.Attributes.attribute "href" "#!"] [Html.text  post.title ]]

-- menuitem : Post -> Html Msg
-- menuitem post =
--   let
--     aktivklass = "active"
--   in
--   Html.li [Html.Attributes.attribute "class" aktivklass] [Html.text "
--     ", Html.a [Html.Attributes.attribute "href" "#", Html.Events.onClick ( SetPost post.id )] [Html.text  post.title], Html.text "
--   "]
--
-- postcontentz : Post -> Html Msg
-- postcontentz post =
--   Html.div [Html.Attributes.attribute "class" "row"] [Html.text "
--         ", Html.div [Html.Attributes.attribute "class" "col s12 m6"] [Html.text "
--           ", Html.div [Html.Attributes.attribute "class" "card blue-grey darken-1"] [Html.text "
--             ", Html.div [Html.Attributes.attribute "class" "card-content white-text"] [Html.text "
--               ", Html.span [Html.Attributes.attribute "class" "card-title"] [Html.text  post.title], Html.text "
--               ", Html.p [] [Html.text  post.content], Html.text "
--             "], Html.text "
--             ", Html.div [Html.Attributes.attribute "class" "card-action"] [Html.text "
--               ", Html.a [Html.Attributes.attribute "href" "#"] [Html.text "This is a link"], Html.text "
--               ", Html.a [Html.Attributes.attribute "href" "#"] [Html.text "This is a link"], Html.text "
--             "], Html.text "
--           "], Html.text "
--         "], Html.text "
--       "]
--

view : Model -> Html Msg
view model =
  Html.div [] [
    Html.div [Html.Attributes.attribute "class" "input-field col s6"] [
      Html.label [Html.Attributes.attribute "for" "topic"] [Html.text "Sök ämne"]
      , Html.input [Html.Attributes.attribute "type" "text", Html.Attributes.attribute "class" "validate", Html.Events.onInput UpdateTopic, Html.Attributes.attribute "value" model.topic] []
    ]
    , Html.button [Html.Attributes.attribute "class" "btn red", Html.Events.onClick MorePlease] [Html.text "Ladda fler"]
    , Html.br [] []
    , Html.img [Html.Attributes.attribute "src" model.gifUrl] []
  ]

--   let
--     -- posts = (List.map menuitem model.posts)
--     -- postcontent = [postcontentz model.post]
--   in
--   Html.div [] [Html.text "
--     ", Html.nav [] [Html.text "
--     ", Html.div [Html.Attributes.attribute "class" "nav-wrapper"] [Html.text "
--       ", Html.a [Html.Attributes.attribute "href" "#!", Html.Attributes.attribute "class" "brand-logo"] [Html.text "Logo"], Html.text "
--       ", Html.a [Html.Attributes.attribute "href" "#", Html.Attributes.attribute "data-activates" "mobile-demo", Html.Attributes.attribute "class" "button-collapse"] [Html.i [Html.Attributes.attribute "class" "material-icons"] [Html.text "menu"]], Html.text "
--       ", Html.ul [Html.Attributes.attribute "id" "slide-out", Html.Attributes.attribute "class" "side-nav fixed"] ([Html.text "
--       "] ++ posts ++ [Html.text "
--       ", Html.li [] [Html.a [Html.Attributes.attribute "href" "#"] [Html.text "Hoho"]], Html.text "
--
--     "]), Html.text "
--     ", Html.a [Html.Attributes.attribute "href" "#", Html.Attributes.attribute "data-activates" "slide-out", Html.Attributes.attribute "class" "button-collapse"] [Html.i [Html.Attributes.attribute "class" "mdi-navigation-menu"] []], Html.text "
--       ", Html.ul [Html.Attributes.attribute "class" "side-nav", Html.Attributes.attribute "id" "mobile-demo"] [Html.text "
--         ", Html.li [] [Html.a [Html.Attributes.attribute "href" "sass.html"] [Html.text "Projekt"]], Html.text "
--         ", Html.li [] [Html.a [Html.Attributes.attribute "href" "collapsible.html"] [Html.text "Länkar"]], Html.text "
--       "], Html.text "
--     "], Html.text "
--   "], Html.text "
--     ", Html.div [Html.Attributes.attribute "class" "row"] [Html.text "
--       ", Html.div [Html.Attributes.attribute "class" "col l6 offset-l3"] [Html.text "
--         ", Html.div [] postcontent, Html.text "
--         ", Html.button [Html.Attributes.attribute "class" "btn red", Html.Events.onClick Pang] [Html.text "radera", Html.i [Html.Attributes.attribute "class" "large material-icons"] [Html.text "delete"]], Html.text "
--       "], Html.text "
--     "], Html.text "
--   "]
