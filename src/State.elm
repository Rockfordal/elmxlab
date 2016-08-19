module State exposing (..)

import Types       exposing (Model, Msg(..), Shelf)
import Maybe       exposing (withDefault)
import List        exposing (head)
import Routes      exposing (Sitemap(..))
import Service     exposing (getShelfs, deleteShelf, postShelf)
import ServiceHelp exposing (..)
import StateHelp   exposing (..)
import Ports       exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ route } as model) =
    case msg of
        RouteTo route            -> model ! [ Routes.navigateTo route ]

        FetchShelfSucceed shelfs -> ({ model | shelfs = shelfs }, Cmd.batch [(formFix ())])
        FetchItemSucceed items   -> ({ model | items  = items }, Cmd.batch [(formFix ())])
        FetchFail _              -> (model, Cmd.none)

        CreateShelf              -> (model, postShelf)
        CreatedShelf res         -> (model, Cmd.none)
        CreateShelfFail res      -> (model, Cmd.none)

        DeleteShelf id           -> (model, (deleteShelf id))
        DeleteShelfFail err      -> (model, Cmd.none)
        NoOp                     -> (model, Cmd.none)
        Alerta msg               -> (model, Cmd.batch [(alert msg)])
        FormFix                  -> (model, Cmd.batch [(formFix ())])

        DeletedShelf res ->
          let
              maybeid   = resToInt res.value
              newshelfs = maybeRemoveById maybeid model.shelfs
          in
              ({ model | shelfs = newshelfs}, Cmd.none)

        SetShelf id ->
          let
              nylista  = selectById id model.shelfs
              newshelf = withDefault model.shelf (head nylista)
          in
              ({ model | shelf = newshelf }, Cmd.none)
