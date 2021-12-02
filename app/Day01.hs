module Day01 (solution) where
import qualified AOC

part1 :: [Integer] -> Integer
part1 = snd . (foldr f (0, 0))
  where f a (n, c) = (a, if a < n then succ c else c)

part2 :: [Integer] -> Integer
part2 xs = part1 $ sum <$> window xs
  where
    window [] = [[]]
    window (x:xs) = (x : (take 2 xs)) : window xs
    
solution = AOC.solution part1 part2
           $ fmap read <$> lines <$> readFile "inputs/day1.txt"
