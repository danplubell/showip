module Main where

import           Network.Socket
import           System.Environment

myHints::AddrInfo
myHints = defaultHints {addrSocketType =  Stream}

main :: IO ()
main = do
  args <- getArgs
  case args of
    []  -> putStrLn "Usage: showIP hostname"
    (h:_)     ->   do
                    addrInfoList <- getAddrInfo (Just myHints) (Just h)  Nothing
                    mapM_  showit addrInfoList
                    where showit a  = putStrLn $ show (addrFamily a) ++ ":" ++ show  (addrAddress a)

