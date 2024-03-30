module Main where

import           Data.Binary
import qualified Data.ByteString.Lazy as L
import           Hexdump
import           OLE
import           OLE.HeaderBlock
import           System.IO

main :: IO ()
main = do
  file <- L.readFile "sample.hwp"
  let header = L.take 0x200 file
  print (decode header :: HeaderBlock)

  handle <- openFile "sample.hwp" ReadMode
  bytes <- readBlock handle (-1)
  putStrLn (prettyHex bytes)
