module Main where

import Control.Concurrent
--import Control.Monad
--import System.IO
import System.Environment
--import Control.Applicative

sfib :: Int -> Int
sfib 0 = 0
sfib 1 = 1
sfib n = sfib (n - 1) + sfib (n - 2)

fib :: Int -> IO Int
fib n =
    if n < 13 then return $ sfib n
    else do
        n1m <- newEmptyMVar
        _ <- forkIO (fib (n - 1) >>= putMVar n1m)
        n2 <- fib (n - 2) 
        n1 <- takeMVar n1m
        return $ n1 + n2 
        

main::IO()
main = do
    [nStr] <- getArgs
    let n = read nStr :: Int
    fib n >>= print
    --hSetBuffering stdout NoBuffering
    --vars <- forM [1::Int .. 1000000] $ \x -> do
    --    m <- newEmptyMVar 
    --    _ <- forkIO $ threadDelay (10^3) >> putMVar m x
    --    return m
    --_ <- mapM takeMVar vars
    putStrLn "Done"
        

