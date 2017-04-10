module Paths_titso (
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
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/Dima_Ryskin/.cabal/bin"
libdir     = "/Users/Dima_Ryskin/.cabal/lib/x86_64-osx-ghc-7.10.3/titso-0.1.0.0-48Ahr9EX9PeASR5nHhUwc6"
datadir    = "/Users/Dima_Ryskin/.cabal/share/x86_64-osx-ghc-7.10.3/titso-0.1.0.0"
libexecdir = "/Users/Dima_Ryskin/.cabal/libexec"
sysconfdir = "/Users/Dima_Ryskin/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "titso_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "titso_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "titso_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "titso_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "titso_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
