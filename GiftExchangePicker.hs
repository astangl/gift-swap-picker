-- Compute random person (e.g., for gift exchange) pairing, forming a
-- Hamiltonian (all vertex) cycle, constrained to not match w/ self or spouse. 
-- Alex Stangl
--
-- To use:
-- 1. List all names of participants on "data Person" line below.
-- 2. List all couple on the couples = line below.
-- 3. Seed prng to random value (e.g., ISO date code of holiday in question.)
-- 4. Run main.

import Data.List(permutations)
import System.Random(mkStdGen,randomR)

data Person = Elizabeth | Darcy | Jane | Bingley | Mary | Kitty | Lydia | Wickham
  deriving (Enum, Eq, Show)

couples = [(Elizabeth,Darcy),(Jane,Bingley),(Lydia,Wickham)]
prng = mkStdGen 18131225

orderInsensitivePairMatch p1 p2@(e1,e2) = let rp2 = (e2,e1)
                                          in p1 == p2 || p1 == rp2

-- Is total solution good, i.e., no couple adjacent?
goodSol lst = all couplePositionOk couples
  where couplePositionOk t1 = (not . any (orderInsensitivePairMatch t1)) lst

solver = let allPeople = [toEnum 0 ..]
             zipup lst = (zip lst . tail . cycle) lst
             goodSols = (filter goodSol . map zipup . permutations) allPeople
             rndIndex = fst (randomR (0, length goodSols - 1) prng)
         in goodSols !! rndIndex

main = mapM_ (\(x,y) -> putStrLn (show x ++ " -> " ++ show y)) solver
