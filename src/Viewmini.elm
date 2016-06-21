module Viewmini exposing (..)
import Types exposing (Model, Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import Markdown exposing (toHtml)


postitem : String -> Html Msg
postitem post =
  let
    rawpost = Markdown.toHtml [] post
  in
    Html.div
      []
      [ rawpost ]

-- [ Html.Attributes.attribute "class" "collection" ]
