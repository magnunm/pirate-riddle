module Lib
    ( distribution
    ) where

import           Data.List (sortBy)

-- | Optimal (Nash equilibrium) distribution of coins to `n` pirates.
--
-- Including the Captain. Argument `n` is a non-zero integer.
distribution :: Int -> [Int]
distribution 1 = [100]
distribution n =
  if n <= 0
    then error "Number of pirates must be positive"
    else (numCoinsToDistribute n - sum distributionTail) : distributionTail
  where distributionTail = distributionForPirates (distribution (n - 1))

-- | The distribution the Captain should suggest for his subordinate pirates.
--
-- Given the Nash equilibrium distribution between said pirates if the Captain
-- was killed.
distributionForPirates :: (Integral a) => [a] -> [a]
distributionForPirates prevDist =
  let yays = neededYays (length prevDist)
      piratesByCost = piratesByMinForYay prevDist
  in
    map snd $ sortByFst $ mapFromIndex (\(i, _) -> (i, 0)) yays piratesByCost

-- | Sort the non-captain pirates by coins required for yay.
--
-- From lowest to highest minimum required for a yay. Returned together with
-- their index from the captain, starting at 1 for the first pirate after the
-- captain. Takes the Nash equilibrium distribution of coins if the captain
-- is killed as argument.
piratesByMinForYay :: (Integral a, Integral b) => [a] -> [(b, a)]
piratesByMinForYay prevDist =
  sortBy (\(_, x) (_, y) -> compare x y) (zip [1..] (map (+ 1) prevDist))

-- | Yay's needed from non-captain pirates to pass the vote.
--
-- Given the number of pirates excluding the captain.
neededYays :: (Integral a) => a -> a
neededYays numPirates =
  quot piratesAndCaptain 2 - if rem piratesAndCaptain 2 == 0 then 1 else 0
  where piratesAndCaptain = numPirates + 1

mapFromIndex :: (a -> a) -> Int -> [a] -> [a]
mapFromIndex _ _ [] = []
mapFromIndex func index (x:xs) =
  if index == 0 then map func (x:xs) else x:(mapFromIndex func (index - 1) xs)

sortByFst :: (Integral a) => [(a, b)] -> [(a, b)]
sortByFst = sortBy (\(x, _) (y, _) -> compare x y)

-- | Increase the number of coins for higher `n` to avoid running out of coins.
--
-- The 100 coins of the original puzzle can only be distributed to a maximum of
-- 200 pirates.
numCoinsToDistribute :: Int -> Int
numCoinsToDistribute n = 100 + if n < 200 then 0 else (n - 200)
