module State exposing (..)

import Types exposing (Model, Msg(..))
import Service exposing (getShelfs)
import Debug exposing (log)
import Data exposing (s1, i1)
import Maybe exposing (withDefault)
import Array exposing (fromList, get)


initialModel : Model
initialModel =
  { shelfs = [s1]
  , shelf = s1
  , items = [i1]
  , item = i1
  }


init : (Model, Cmd Msg)
init =
  ( initialModel , getShelfs)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    FetchShelfSucceed shelfs ->
        ({ model | shelfs = shelfs }, Cmd.none)

    FetchItemSucceed items ->
        ({ model | items = items }, Cmd.none)

    FetchFail _ ->
      let
        logga = log "error" ""
      in
        (model, Cmd.none)

    SetShelf id ->
      let
        nylista = (List.filter (\p -> p.id == id) model.shelfs)
        mabynewshelf = (List.head nylista)
        newshelf = withDefault model.shelf (List.head nylista)
      in
        ({ model | shelf = newshelf }, Cmd.none)

    -- Tick newTime ->
    --   let
    --     updateInterval = 3
    --     shelflength = List.length model.shelfs
    --     willupdate = model.counter % updateInterval == 0
    --     indexid = nextid model.shelfindex shelflength
    --     shelfs = fromList model.shelfs
    --     shelf = withDefault model.shelf (get indexid shelfs)
    --     -- logga = log "indexid" indexid
    --   in
    --     if willupdate then
    --       ( { model | counter   = model.counter + 1
    --                 , shelf      = shelf
    --                 , shelfindex = indexid }
    --       , Cmd.none)
    --     else
    --       ({ model | counter = model.counter + 1 }
    --        , Cmd.none)


nextid : Int -> Int -> Int
nextid i cap =
  if i < (cap - 1) then
    i + 1
  else
    0
