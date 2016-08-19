module Init exposing (init)

import Routes     exposing (Sitemap)
import Types      exposing (Model, Msg(..))
import StateHelp  exposing (urlUpdate)
import Data       exposing (s1, i1)


init : Sitemap -> ( Model, Cmd Msg )
init route =
    urlUpdate route
        { route = route
        , shelfs = [s1]
        , shelf = s1
        , items = [i1]
        , item = i1
        , ready = False
        }
