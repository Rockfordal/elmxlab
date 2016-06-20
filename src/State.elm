module State exposing (..)

import Types exposing (Model, Msg(..))
import Service exposing (getRandomGif)
-- import Debug exposing (log)


init : String -> (Model, Cmd Msg)
init topic =
  ( Model topic "waiting.gif"
  , getRandomGif topic
  )
  --   posts = [p1, p2, p3]
  -- , post = p1


update : Msg -> Model -> (Model, Cmd Msg)
update action model =
  case action of
    MorePlease ->
      (model, getRandomGif model.topic)

    FetchSucceed newUrl ->
      (Model model.topic newUrl, Cmd.none)

    FetchFail _ ->
      (model, Cmd.none)

    UpdateTopic topic ->
     ({ model | topic = topic }, Cmd.none)

    -- Stöd ->
    --   ({ model | post = p2 }, Cmd.none)
    --
    -- Pang ->
    --   { model | posts = List.filter (\p -> p.title /= "hej") model.posts }
    --
    -- Texas ->
    --   { model | post = p1 }

    -- Grillparty ->
    --   { model | post = p3 }
    --
    -- SetPost id ->
    --   let
    --     nylista = (List.filter (\p -> p.id == id) model.posts)
    --     mabynewpost = (List.head nylista)
    --     newpost = withDefault model.post (List.head nylista)
    --   in
    --     { model | post = newpost }


-- p1 : Post
-- p1 =
--   { title = "Texas"
--   , content = "God dag från texas här äter vi inte hundar och sover inte med ögonen öppna<b>LOOOOL</b>"
--   , id = 1
--   }
--
-- p2 : Post
-- p2 =
--   { title = "Stöd och matchning"
--   , content = "har går ett ex antal individer mot greatness!"
--   , id = 2
--   }
--
-- p3 : Post
-- p3 =
--   { title = "Grillparty"
--   , content = "vi följer vårat stolta landslag mot erövringar i europa!"
--   , id = 3
--   }
