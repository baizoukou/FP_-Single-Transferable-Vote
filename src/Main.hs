import Parser(parseInput)
import Lib(solve)
import Data.List(isSuffixOf, sortOn)
import System.Environment
import System.Directory

main = do
    args <- getArgs

    let
        usgMsg = "Usage: votes <path-to-csv>"
        errMsg = "Error: this is not a valid file: "
        file   = head args
    if null args 
        then putStrLn usgMsg
        else do
            fileOk <- doesFileExist file
            if not fileOk || not (".csv" `isSuffixOf` file)
                then putStrLn $ errMsg ++ file
                else do
                    content <- readFile file
                    let 
                        res = zip (reverse . sortOn snd $ solve content) [1..]
                        
                        format :: ((String, Int),Int) -> String
                        format ((s, w), r) = s ++ " " ++ show r ++ " " ++ show w

                    putStr . unlines . map format $  res