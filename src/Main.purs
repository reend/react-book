module Main where

import Prelude
import Data.Tuple.Nested ((/\))
import React.Basic.Events (handler_)
import React.Basic.DOM (render)
import React.Basic.Hooks as React
import React.Basic.Hooks (Component, component, useState)
import React.Basic.DOM as R
import Effect (Effect)
import Effect.Exception (throw)
import Web.DOM.NonElementParentNode (getElementById)
import Web.HTML.HTMLDocument (toNonElementParentNode)
import Web.HTML.Window (document)
import Web.HTML (window)
import Data.Maybe (Maybe(..))

counter :: Component Int
counter = do
  component "Counter" \initialValue -> React.do
    counter /\ setCounter <- useState initialValue

    pure
      $ R.button
          { onClick: handler_ do
              setCounter (_ + 1)
          , children:
              [ R.text $ "Increment: " <> show counter ]
          }

main :: Effect Unit
main = do
  appRoot <- getElementById "app" =<< (map toNonElementParentNode $ document =<< window)
  counter <- counter
  case appRoot of
    Just appRoot' -> render (counter 0) appRoot'
    Nothing -> throw "App root not found!"