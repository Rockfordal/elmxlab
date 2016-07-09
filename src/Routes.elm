module Routes exposing (Sitemap(..), parsePath, navigateTo, toString)

import Navigation exposing (Location)
import Route exposing (..)


type Sitemap
    = HomeR ()
    | AboutR ()
    | ShelfR ()
    | NotFoundR


homeR =
    HomeR := static ""


aboutR =
    AboutR := static "about"

shelfR =
    ShelfR := static "shelfs"


sitemap =
    router [ homeR, aboutR, shelfR ]


match : String -> Sitemap
match =
    Route.match sitemap
        >> Maybe.withDefault NotFoundR


toString : Sitemap -> String
toString r =
    case r of
        HomeR () ->
            reverse homeR []

        AboutR () ->
            reverse aboutR []

        ShelfR () ->
            reverse shelfR []

        NotFoundR ->
            Debug.crash "cannot render NotFound"


parsePath : Location -> Sitemap
parsePath =
    .pathname >> match


navigateTo : Sitemap -> Cmd msg
navigateTo =
    toString >> Navigation.newUrl
