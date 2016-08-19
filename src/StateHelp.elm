module StateHelp exposing (..)

import Types      exposing (Model, Msg(..), Shelf)
import Routes     exposing (Sitemap(..))
import Ports      exposing (closeModal, hejja)
import Service    exposing (getShelfs, deleteShelf, postShelf, getItems)


selectById: Int -> List Shelf -> List Shelf
selectById id coll = List.filter (\p -> p.id == id) coll


removeById : Int -> List Shelf -> List Shelf
removeById id coll = List.filter (\s -> s.id /= id) coll


maybeRemoveById : Maybe Int -> List Shelf -> List Shelf
maybeRemoveById maybeid coll =
    case maybeid of
      Just id -> removeById id coll
      Nothing -> coll


-- maybeLog maybeid =
--   case maybeid of
--     Just id -> log "deltedShelf" id
--     Nothing -> log "fail" 0


urlUpdate : Sitemap -> Model -> ( Model, Cmd Msg )
urlUpdate route ({ ready } as m) =
    let
        model = { m | route = route }
    in
        case route of
            ShelfR () ->
                if ready then model ! [ hejja () ]
                         else model ! [ getShelfs ]

            ItemR () ->
                model ! [ getItems ]

            _ ->
                model ! []