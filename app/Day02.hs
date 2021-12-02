module Day02 (solution) where
import Data.List (foldl')
import qualified AOC

data Direction a = Forward a | Down a | Up a

str2dir :: String -> Direction Integer
str2dir = f . words
  where f (dir:n:_) = (case dir of
                        "forward" -> Forward
                        "up" -> Up
                        "down" -> Down) $ read n

part1 = uncurry (*) . foldr f (0, 0)
  where f dir (h, d) = case dir of
                         Forward n -> (h + n, d)
                         Up n -> (h, d - n)
                         Down n -> (h, d + n)

part2 = (\(a, b, _) -> a * b) . foldl' f (0, 0, 0)
  where f (h, d, a) dir = case dir of
                            Forward n -> (h + n, d + a * n, a)
                            Up n -> (h, d, a - n)
                            Down n -> (h, d, a + n)

solution = AOC.solution part1 part2
           $ map str2dir <$> lines <$> readFile "inputs/day2.txt"
