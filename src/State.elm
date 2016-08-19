module State exposing (..)

import Types      exposing (Model, Msg(..), Shelf)
import Data       exposing (s1, i1)
import Maybe      exposing (withDefault)
import Routes     exposing (Sitemap(..))
import Service    exposing (getShelfs, deleteShelf, postShelf, getItems)
import ServiceHelp exposing (..)
import StateHelp   exposing (..)
-- import Navigation exposing (Location)
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
        NoOp                     -> (model, Cmd.none)

        DeletedShelf res ->
          let
              maybeid = resToInt res.value
              newshelfs = maybeRemoveById maybeid model.shelfs
          in
              ({ model | shelfs = newshelfs}, Cmd.none)

        SetShelf id ->
          let
              -- nylista = (List.filter (\p -> p.id == id) model.shelfs)
              -- nylista = (List.filter (\p -> p.id == id) model.shelfs)
              nylista = selectById id model.shelfs
              newshelf = withDefault model.shelf (List.head nylista)
          in
              ({ model | shelf = newshelf }, Cmd.none)
