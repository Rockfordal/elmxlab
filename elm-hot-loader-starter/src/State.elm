module State exposing (..)
import Types exposing (Post, Model, Msg(..))
import Service
import Maybe exposing (..)
import Task exposing (..)
import Debug exposing (log)

model : Model
model =
  {posts = [newPost, newPost, nejPost]}

newPost : Post
newPost =
   { title = "hej",
      content = "Simple card. I am good at containing small bits of information.
      I am convenient because I require little markup to use effectively."
    }

nejPost : Post
nejPost =
   { title = "NEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEJ",
      content = "SLUTA FIS!!!!!!"
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
