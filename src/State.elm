module State exposing (..)

import Types exposing (Model, Msg(..))
import Data    exposing (s1, i1)
import Maybe   exposing (withDefault)
import Array   exposing (fromList, get)
-- import Item.State
-- import Item.Types
-- import GraphQL.GetLinks   as GetLinks   exposing (QueryLinksResult)
-- import GraphQL.CreateLink as CreateLink exposing (MutationResult)
-- import GraphQL.DeleteLink as DeleteLink exposing (DeleteLinkResult)
-- import GraphQL.UpdateLink as UpdateLink exposing (UpdateLinkResult)
import Ports exposing (closeModal, hejja)
import Task
import Debug exposing (log)
import Navigation exposing (Location)
import Routes exposing (Sitemap(..))
import Service exposing (getShelfs, deleteShelf, postShelf)


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
        -- , error = Nothing
        -- , searchStr = ""
        -- , sortby = "title"
        -- , sortdir = "asc"
        -- , item = Item.State.initialModel
        -- , items = [{id = "1", title = "Hard", url = "http://coded.nu", createdAt = "2010-01-01"}]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ route } as model) =
    case msg of
        NoOp ->
            ( model, Cmd.none)

        RouteTo route ->
            model ! [ Routes.navigateTo route ]

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

        CreateShelf ->
            (model, postShelf)

        CreatedShelf res ->
          let
              logga = "createdshelf"
          in
              (model, Cmd.none)

        CreateShelfFail res ->
          let
              logga = log "createShelfError" res
          in
              (model, Cmd.none)

        DeleteShelf id ->
              (model, (deleteShelf id))

        DeleteShelfFail err ->
          let
              logga = log "deleteShelfError" err
          in
              (model, Cmd.none)

        DeletedShelf res ->
          let
              logga = log "deletedShelf" "mm"
              -- newshelfs = (List.filter (\s -> s.id /= id) model.shelfs)
          in
              (model, Cmd.none)
              -- ({ model | shelfs = newshelfs}, deleteShelf id)


        -- UpdateSearch str ->
        --     let
        --         newModel =
        --             { model | searchStr = str }
        --     in
        --         ( newModel
        --         , getQuery str model.sortby model.sortdir
        --         )
        --
        -- Sortby sortby ->
        --     let
        --         newModel =
        --             { model | sortby = sortby }
        --     in
        --     ( newModel
        --     , getQuery model.searchStr sortby model.sortdir
        --     )
        --
        -- Sortdir sortdir ->
        --     let
        --         newModel =
        --             { model | sortdir = sortdir }
        --     in
        --     ( newModel
        --     , getQuery model.searchStr model.sortby sortdir
        --     )
        --
        -- ClearItem ->
        --     let
        --         newModel = model
        --         -- newModel =
        --         --     { model | item = Item.State.initialModel }
        --     in
        --     ( newModel
        --     , Cmd.none
        --     )
        --
        -- UpdateTitle str ->
        --     let
        --         item =
        --             model.item
        --
        --         updatedItem =
        --             { item | title = str }
        --
        --         newModel =
        --             { model | item = updatedItem }
        --
        --     in
        --         ( newModel
        --         , Cmd.none
        --         )
        --
        -- UpdateUrl str ->
        --     let
        --         item =
        --             model.item
        --
        --         updatedItem =
        --             { item | url = str }
        --
        --         newModel =
        --             { model | item = updatedItem }
        --     in
        --         ( newModel
        --         , Cmd.none
        --         )
        --
        -- Get maybeQuery ->
        --     let
        --         newItems =
        --             case maybeQuery of
        --                 Just query ->
        --                     let
        --                         list =
        --                             toList query
        --                     in
        --                         List.map edgeToItem list
        --
        --                 Nothing ->
        --                     []
        --
        --         newModel =
        --             { model | items = newItems
        --                     , ready = True
        --             }
        --
        --     in
        --         ( newModel
        --         , Cmd.none
        --         )
        --
        --
        -- Add maybeQuery ->
        --     let
        --         newModel =
        --           case maybeQuery of
        --               Just query ->
        --                   let
        --                       maybenewItem =
        --                           toMaybeNewItem query
        --                       newItem =
        --                           (defaultItem maybenewItem)
        --                   in
        --                       { model
        --                           | items = newItem :: model.items
        --                           , item = Item.State.initialModel
        --                       }
        --               Nothing ->
        --                       model
        --     in
        --         ( newModel
        --         , closeModal ()
        --         )
        --
        --
        -- Del maybeQuery ->
        --     let newModel =
        --       case maybeQuery of
        --           Just query ->
        --                   let
        --                       maybedelItem = toMaybeDelItem query
        --                       delItem = (defaultItem maybedelItem)
        --                       id = delItem.id
        --                       -- logger = log "del id" id
        --                   in
        --                       { model | items = List.filter (\t -> t.id /= id) model.items }
        --           Nothing ->
        --                   model
        --     in
        --         ( newModel
        --         , Cmd.none
        --         )
        --
        --
        -- Update maybeQuery ->
        --     let newModel =
        --       case maybeQuery of
        --           Just query ->
        --                   let
        --                       maybeupdatedItem = toMaybeUpdatedItem query
        --                       updatedItem = (defaultItem maybeupdatedItem)
        --                       updateItem t =
        --                         if t.id == updatedItem.id then { t | title = updatedItem.title
        --                                                            , url = updatedItem.url } else t
        --                   in
        --                       { model | items = List.map updateItem model.items }
        --           Nothing ->
        --                   model
        --     in
        --         ( newModel
        --         , closeModal ()
        --         )
        --
        --
        -- TryAdd ->
        --     ( model
        --     , postQuery model.item
        --     )
        --
        --
        -- TryDel str ->
        --     ( model
        --     , delQuery str
        --     )
        --
        --
        -- TryUpdate ->
        --     let
        --         item = model.item
        --     in
        --       ( model
        --       , updateQuery item.id item.title item.url
        --       )
        --
        --
        -- SetItem item ->
        --     let
        --         newModel =
        --             { model | item = item }
        --     in
        --     ( newModel
        --     , Cmd.none
        --     )


urlUpdate : Sitemap -> Model -> ( Model, Cmd Msg )
urlUpdate route ({ ready } as m) =
    let
        model =
            { m | route = route }
    in
        case route of
            ShelfR () ->
                if ready then
                    model ! [ hejja () ]
                else
                    -- model ! [ getQuery "" "title" "asc" , hejja () ]
                    model ! [ getShelfs ]

            _ ->
                model ! []



-- toList queriedObject =
--     queriedObject.store.linkConnection.edges
--
-- toMaybeNewItem queriedObject =
--     queriedObject.createLink.linkEdge.node
--
-- toMaybeDelItem queriedObject =
--     queriedObject.deleteLink.linkEdge.node
--
-- toMaybeUpdatedItem queriedObject =
--     queriedObject.updateLink.linkEdge.node
--
-- defaultItem item =
--     Item.Types.Model
--         (Maybe.withDefault "Missing id"        item.id)
--         (Maybe.withDefault "Missing title"     item.title)
--         (Maybe.withDefault "Missing url"       item.url)
--         (Maybe.withDefault "Missing createdAt" item.createdAt)
--
-- edgeToItem edge =
--     defaultItem edge.node
--
--
-- getQuery searchString sortString dirString =
--     GetLinks.queryLinks { queryParam = searchString, orderBy = sortString, orderDir = dirString}
--         |> Task.toMaybe
--         |> Task.perform (\_ -> NoOp) Get
--
-- updateQuery idString titleString urlString =
--     UpdateLink.updateLink { id = idString, title = titleString, url = urlString }
--         |> Task.toMaybe
--         |> Task.perform (\_ -> NoOp) Update -- (\_ -> NoOp)
--
--
-- postQuery item =
--     CreateLink.mutation { title = item.title, url = item.url }
--         |> Task.toMaybe
--         |> Task.perform (\_ -> NoOp) Add
--
--
-- delQuery str =
--     DeleteLink.deleteLink { id = str }
--         |> Task.toMaybe
--         |> Task.perform (\_ -> NoOp) Del


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


-- nextid : Int -> Int -> Int
-- nextid i cap =
--   if i < (cap - 1) then
--     i + 1
--   else
--     0
