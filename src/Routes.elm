module Routes exposing (Sitemap(..), parsePath, navigateTo, toString)

import Navigation exposing (Location)
import Route exposing (..)


type Sitemap
    = HomeR ()
    | AboutR ()
    | ShelfR ()
    | ItemR ()
    | NotFoundR


homeR  = HomeR  := static ""
aboutR = AboutR := static "about"
shelfR = ShelfR := static "shelfs"
itemR  = ItemR  := static "items"

sitemap = router [ homeR, aboutR, shelfR, itemR ]


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

        ItemR () ->
            reverse itemR []

        NotFoundR ->
            Debug.crash "cannot render NotFound"


parsePath : Location -> Sitemap
parsePath =
    .pathname >> match


navigateTo : Sitemap -> Cmd msg
navigateTo =
    toString >> Navigation.newUrl
