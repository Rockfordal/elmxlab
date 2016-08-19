port module Ports exposing (..)

-- OUTGOING
port closeModal  : () -> Cmd msg
port formFix     : () -> Cmd msg
port alert       : String -> Cmd msg
