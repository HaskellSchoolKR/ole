module Main where

import           Data.Binary
import qualified Data.ByteString.Lazy as L
import           Hexdump
import           OLE
import           OLE.BBAT
import           OLE.HeaderBlock
import           System.IO

main :: IO ()
main = do
  file <- L.readFile "sample.hwp"
  let header = decode (L.take 0x200 file) :: HeaderBlock
  print header

  handle <- openFile "sample.hwp" ReadMode
  bytes <- readBlock handle ((-1) :: Int)
  putStrLn (prettyHex bytes)

  table <- bbat handle (arrayOfBBATdepotMembers header)
  print table

  let start = fromIntegral (startBlockOfProperty header)
  print (chain table start)
