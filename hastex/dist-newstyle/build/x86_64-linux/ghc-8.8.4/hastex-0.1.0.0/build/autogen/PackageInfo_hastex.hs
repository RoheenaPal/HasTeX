{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module PackageInfo_hastex (
    name,
    version,
    synopsis,
    copyright,
    homepage,
  ) where

import Data.Version (Version(..))
import Prelude

name :: String
name = "hastex"
version :: Version
version = Version [0,1,0,0] []

synopsis :: String
synopsis = "PDF generator: LaTeX -> PDF"
copyright :: String
copyright = ""
homepage :: String
homepage = ""
