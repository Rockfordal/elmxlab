module State exposing (..)

import Types exposing (Model, Msg(..))
import Service exposing (getPosts)
import Debug exposing (log)
import Data exposing (p1, p2, p3)
import Maybe exposing (withDefault)
import Array exposing (fromList, get)


initialModel : String -> Model
initialModel topic =
  { topic = topic
  , gifUrl = ""
  , posts = [p1, p2, p3]
  , post = p1
  , counter = 0
  , postindex = 0
  }


init : String -> ( Model, Cmd Msg )
init topic =
  (  initialModel topic
  , getPosts
  )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    MorePlease ->
      ( model
      , getPosts
      )

    FetchSucceed posts ->
      let
        logga = log "succes" posts
      in
        ({ model | posts = posts }, Cmd.none)

    FetchFail _ ->
      (model, Cmd.none)

    UpdateTopic topic ->
      ({model | topic = topic}, Cmd.none)

    SetPost id ->
      let
        nylista = (List.filter (\p -> p.id == id) model.posts)
        mabynewpost = (List.head nylista)
        newpost = withDefault model.post (List.head nylista)
      in
        ({ model | post = newpost }, Cmd.none)

    -- Tick newTime ->
    --   let
    --     indexid = nextid model.interval (List.length model.posts)
    --     posts = fromList model.posts
    --     post = withDefault model.post (get indexid posts)
    --   in
    --     if model.interval < 3 then
    --       ( { model | interval = indexid
    --                 , post     = post }
    --       , Cmd.none)
    --     else
    --       (model, Cmd.none)

    Tick newTime ->
      let
        updateInterval = 3
        postlength = List.length model.posts
        willupdate = model.counter % updateInterval == 0
        indexid = nextid model.postindex postlength
        posts = fromList model.posts
        post = withDefault model.post (get indexid posts)
        -- logga = log "indexid" indexid
      in
        if willupdate then
          ( { model | counter   = model.counter + 1
                    , post      = post
                    , postindex = indexid }
          , Cmd.none)
        else
          ({ model | counter = model.counter + 1 }
           , Cmd.none)


nextid : Int -> Int -> Int
nextid i cap =
  if i < (cap - 1) then
    i + 1
  else
    0
