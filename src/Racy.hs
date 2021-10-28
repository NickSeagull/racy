module Racy
  ( start,
    compile,
  )
where

import qualified Data.EDN as EDN

start :: IO ()
start = putStrLn "Racy"

compile :: [EDN.TaggedValue] -> [AHK.Statement]
compile = undefined