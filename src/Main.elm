module Main exposing (main)
import Navigation
import Routes
import State exposing (update, urlUpdate, init)
import Types exposing (Model, Msg)
import Views.View exposing (view)


main : Program Never
main =
  Navigation.program (Navigation.makeParser Routes.parsePath)
      { init          = init
      , update        = update
      , urlUpdate     = urlUpdate
      , view          = view
      , subscriptions = subscriptions
      }


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
