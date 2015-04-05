module Paths_haskell2 (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/kot/.cabal/bin"
libdir     = "/home/kot/.cabal/lib/x86_64-linux-ghc-7.6.3/haskell2-0.1"
datadir    = "/home/kot/.cabal/share/x86_64-linux-ghc-7.6.3/haskell2-0.1"
libexecdir = "/home/kot/.cabal/libexec"
sysconfdir = "/home/kot/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "haskell2_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "haskell2_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "haskell2_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "haskell2_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "haskell2_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
