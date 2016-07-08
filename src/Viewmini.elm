module Viewmini exposing (..)
import Types exposing (..)
import Html exposing (..)
import Markdown exposing (toHtml)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)


menyitem : Shelf -> Shelf -> Html Msg
menyitem currentshelf menushelf =
  let
    -- escapedtitle   = menushelf.title
    -- escapedcontent = menushelf.content
    -- titlehtml  = Markdown.toHtml [] escapedtitle
    aktivklass =
      if menushelf.id == currentshelf.id then
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
          , onClick (SetShelf menushelf.id)
          ]
          [ text menushelf.name ]
          -- [ titlehtml ]
        ]
      ]


shelfitem : Shelf -> Html Msg
shelfitem shelf =
  -- let
    -- escapedcontent = shelf.name
    -- contenthtml = Markdown.toHtml [] escapedcontent
  -- in
    Html.div
      []
      [ text (shelf.name ++ " hyllstorlek " ++ toString shelf.size)]
      -- [ contenthtml ]
