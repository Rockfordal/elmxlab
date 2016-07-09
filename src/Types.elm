port module Types exposing (..)

import Http
import Routes exposing (Sitemap(..))
-- import Item.Types
-- import GraphQL.GetLinks   as GetLinks   exposing (QueryLinksResult)
-- import GraphQL.CreateLink as CreateLink exposing (MutationResult)
-- import GraphQL.DeleteLink as DeleteLink exposing (DeleteLinkResult)
-- import GraphQL.UpdateLink as UpdateLink exposing (UpdateLinkResult)
-- import Time exposing (Time, second)


type alias Model =
  { route      : Sitemap
  , shelfs     : List Shelf
  , shelf      : Shelf
  , items      : List Item
  , item       : Item
  , ready      : Bool
  -- , error      : Maybe String
  -- , searchStr  : String
  -- , sortby     : String
  -- , sortdir    : String
  -- , items : List Item.Types.Model
  -- , item : Item.Types.Model
  }

type alias Shelf =
  {
    id      : Int
  , name    : String
  , size    : Int
  }

type alias Item =
  {
    id      : Int
  , name    : String
  , info    : String
  }

type Msg
  = RouteTo Sitemap
  | FetchShelfSucceed (List Shelf)
  | FetchItemSucceed (List Item)
  | FetchFail Http.Error
  | SetShelf Int
  | DeleteShelf Int
  | NoOp
  -- | UpdateSearch String
  -- | Sortby String
  -- | Sortdir String
  -- | ClearItem
  -- | UpdateTitle String
  -- | UpdateUrl String
  -- | Get (Maybe QueryLinksResult)
  -- | Add (Maybe MutationResult)
  -- | Del (Maybe DeleteLinkResult)
  -- | Update (Maybe UpdateLinkResult)
  -- | TryAdd
  -- | TryDel String
  -- | TryUpdate
  -- | SetItem Item.Types.Model
  -- | Tick Time


-- type alias Edge =
--     { node :
--         { id : Maybe String
--         , title : Maybe String
--         , url : Maybe String
--         , createdAt : Maybe String
--         }
--     }
--
--
-- type alias QueryResult a b c d =
--     { d
--         | store :
--             { c
--                 | linkConnection :
--                     { b
--                         | edges :
--                             a
--                     }
--             }
--     }
