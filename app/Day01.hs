module Day01 (solution) where
import qualified AOC

part1 :: [Integer] -> Integer
part1 = snd . (foldr f (Nothing, 0))
  where
    f a (Nothing, _) = (Just a, 0)
    f a (Just x, c) = (Just a, if a < x then succ c else c)

part2 :: [Integer] -> Integer
part2 xs = part1 $ sum <$> window xs
  where
    window [] = [[]]
    window (x:xs) = (x : (take 2 xs)) : window xs

solution = AOC.solution part1 part2
           $ fmap read <$> lines <$> readFile "inputs/day1.txt"
