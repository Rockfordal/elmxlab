module Routes exposing (Sitemap(..), parsePath, navigateTo, toString)

import Navigation exposing (Location)
import Route exposing (..)


type Sitemap
    = HomeR  ()
    | ShelfR ()
    | ItemR  ()
    | NotFoundR


homeR  = HomeR  := static ""
itemR  = ItemR  := static "items"
shelfR = ShelfR := static "shelfs"
sitemap = router [ homeR, shelfR, itemR ]


match : String -> Sitemap
match = Route.match sitemap >> Maybe.withDefault NotFoundR


toString : Sitemap -> String
toString r =
    case r of
        HomeR  () -> reverse homeR  []
        ItemR  () -> reverse itemR  []
        ShelfR () -> reverse shelfR []
        NotFoundR -> Debug.crash "cannot render NotFound"


parsePath : Location -> Sitemap
parsePath = .pathname >> match


navigateTo : Sitemap -> Cmd msg
navigateTo = toString >> Navigation.newUrl
