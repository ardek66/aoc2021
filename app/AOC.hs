module AOC where

solution :: Show b => (a -> b) -> (a -> b) -> IO a -> IO ()
solution part1 part2 input = do
  a <- input
  print $ part1 a
  print $ part2 a
