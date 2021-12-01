module Main where
import System.Environment
import Control.Monad

import qualified Day01
import qualified Day02

solutions =
  [ ("Day01", Day01.solution)
  , ("Day02", Day02.solution)
  ]

main :: IO ()
main = do
  days <- getArgs
  forM_ days $ \day -> do
    putStr "=== "
    putStr day
    putStrLn " ==="
    
    case lookup day solutions of
      Nothing -> putStrLn "Invalid day"
      Just sol -> sol
