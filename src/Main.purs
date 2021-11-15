module Main where

import Prelude
import Data.Tuple.Nested ((/\))
import React.Basic.Events (handler_)
import React.Basic.DOM (render)
import React.Basic.Hooks as React
import React.Basic.Hooks (Component, component, useState)
import React.Basic.DOM as R

main :: Component Int
main = do
  component "Counter" \initialValue -> React.do
    counter /\ setCounter <- useState initialValue

    pure
      $ R.button
          { onClick: handler_ do
              setCounter (_ + 1)
          , children:
              [ R.text $ "Increment: " <> show counter ]
          }