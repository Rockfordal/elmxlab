module State exposing (..)

import Types exposing (Post, Model, Msg(..))
import Service
import Maybe exposing (..)
import Task exposing (..)
import Debug exposing (log)


model : Model
model =
  {
    posts = [p1, p2, p3]
  , post = p1
  }


p1 : Post
p1 =
  { title = "Texas"
  , content = "God dag från texas här äter vi inte hundar och sover inte med ögonen öppna<b>LOOOOL</b>"
  , id = 1
  }


p2 : Post
p2 =
  { title = "Stöd och matchning"
  , content = "har går ett ex antal individer mot greatness!"
  , id = 2
  }

p3 : Post
p3 =
  { title = "Grillparty"
  , content = "vi följer vårat stolta landslag mot erövringar i europa!"
  , id = 3
  }

update : Msg -> Model -> (Model)
update action model =
  case action of
    UpdateTitle title ->
      model
      -- { model | title = title }
    Pang ->
      { model | posts = List.filter (\p -> p.title /= "hej") model.posts }
    --  model

    Texas ->
      { model | post = p1 }

    Stöd ->
      { model | post = p2}

    Grillparty ->
      { model | post = p3 }

    SetPost id ->
      let
        nylista = (List.filter (\p -> p.id == id) model.posts)
        mabynewpost = (List.head nylista)
        newpost = withDefault model.post (List.head nylista)
      in
        { model | post = newpost }
