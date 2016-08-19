module State exposing (..)

import Types      exposing (Model, Msg(..))
import Data       exposing (s1, i1)
import Maybe      exposing (withDefault)
import Ports      exposing (closeModal, hejja)
import Routes     exposing (Sitemap(..))
import Service    exposing (getShelfs, deleteShelf, postShelf)
-- import Navigation exposing (Location)
-- import Array      exposing (fromList, get)
-- import Debug      exposing (log)
-- import Task


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


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ route } as model) =
    case msg of
        RouteTo route            -> model ! [ Routes.navigateTo route ]
        FetchShelfSucceed shelfs -> ({ model | shelfs = shelfs }, Cmd.none)
        FetchItemSucceed items   -> ({ model | items = items }, Cmd.none)
        FetchFail _              -> (model, Cmd.none)
        CreateShelf              -> (model, postShelf)
        CreatedShelf res         -> (model, Cmd.none)
        CreateShelfFail res      -> (model, Cmd.none)
        DeleteShelf id           -> (model, (deleteShelf id))
        DeleteShelfFail err      -> (model, Cmd.none)
        DeletedShelf res         -> (model, Cmd.none)
        NoOp                     -> (model, Cmd.none)

        SetShelf id ->
          let
              nylista = (List.filter (\p -> p.id == id) model.shelfs)
              newshelf = withDefault model.shelf (List.head nylista)
          in
              ({ model | shelf = newshelf }, Cmd.none)


urlUpdate : Sitemap -> Model -> ( Model, Cmd Msg )
urlUpdate route ({ ready } as m) =
    let
        model = { m | route = route }
    in
        case route of
            ShelfR () ->
                if ready then model ! [ hejja () ]
                         else model ! [ getShelfs ]
            _         ->
                model ! []
