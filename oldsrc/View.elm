port module View exposing (view)

import Html exposing (div, button, text, h2, input, ul, li)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (..)
import Types exposing (Model, Msg(..))


boxStyle : List ( String, String )
boxStyle =
  [ ("border", "1px solid #ccc")
  , ("border-radius", "4px")
  , ("padding", "10px")
  , ("margin", "10px")
  ]


view : Model -> Html.Html Msg
view model =
  div []
    [ div [ style boxStyle ]
        [ h2 [] [ text "Counter" ]
        , button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (toString model.count) ]
        , button [ onClick Increment ] [ text "+" ]
        ]
    , div [ style boxStyle ]
        [ h2 [] [ text "Time.every second" ]
        , text <| "elapsed seconds: " ++ (toString model.elapsed)
        ]
    , div [ style boxStyle ]
        [ h2 [] [ text "Outgoing Port" ]
        , input [ type' "text", value model.alertText, onInput ChangeAlertText ] []
        , button [ onClick Alert ] [ text "call alert" ]
        ]
    , div [ style boxStyle ]
        [ h2 [] [ text "Inkommande Port" ]
        , ul [] <|
            List.map (\t -> li [] [ text t]) model.logs
        ]
    ]
