import Lib
import Model
import Parser
import Data.List
import qualified Data.Map as M
import System.Environment

main = do

    file:[] <- getArgs

    content <- readFile file
    let 
        (votes, cands) = parseInput content
        newVotes = foldl (\l v -> newVote cands v : l ) [] votes

    --print $ cands  
    --print $ votes 
    --print newVotes
    print $ runElection newVotes 3 cands
    print $ candWeights newVotes
    
    --let rows =  splitRows . lines $ content
    
    --putStrLn . show $ rows
    --print $ solve content