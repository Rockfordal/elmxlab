module Viewmini exposing (..)
import Types exposing (..)
import Html exposing (..)
import Markdown exposing (toHtml)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)


menyitem : Post -> Post -> Html Msg
menyitem currentpost menupost =
  let
    escapedtitle   = menupost.title
    escapedcontent = menupost.content
    titlehtml  = Markdown.toHtml [] escapedtitle
    aktivklass =
      if menupost.id == currentpost.id then
        "active"
      else
        "notactive"
  in
    Html.div
      []
      [ li
        [ class aktivklass]
        [ a
          [ href "#"
          , onClick (SetPost menupost.id)
          ]
          [ titlehtml ]
        ]
      ]


postitem : Post -> Html Msg
postitem post =
  let
    escapedcontent = post.content
    contenthtml = Markdown.toHtml [] escapedcontent
  in
    Html.div
      []
      [ contenthtml ]
