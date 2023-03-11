module Main (main) where

import           System.Environment (getArgs)
import           System.Exit        (ExitCode (ExitFailure, ExitSuccess),
                                     exitWith)
import           Text.Read          (readMaybe)

import           Lib

main :: IO ()
main = getArgs >>= parseArgs >>= print . distribution >> exitSuccess

parseArgs :: [String] -> IO Int
parseArgs [] = putStrLn "Number of pirates required" >> usage >> exitFail
parseArgs (x:_) = case x of
  "-h"     -> usage >> exitSuccess
  "--help" -> usage >> exitSuccess
  _        -> case (readMaybe x :: Maybe Int) of
    Nothing -> putStrLn "Number of pirates must be an integer" >> usage >> exitFail
    Just numPirates -> pure numPirates

usage = putStrLn "Usage: pirate-riddle [integer number of pirates]"

exitFail = exitWith (ExitFailure 1)

exitSuccess = exitWith ExitSuccess
