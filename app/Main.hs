module Main where

import           Data.Binary
import qualified Data.ByteString.Lazy as L
import           OLE

main :: IO ()
main = do
  file <- L.readFile "sample.hwp"
  let header = L.take 0x200 file
  print (decode header :: HeaderBlock)
