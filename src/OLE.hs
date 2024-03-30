module OLE where

import qualified Data.ByteString as B
import           OLE.HeaderBlock
import           System.IO

data OLE = OLE HeaderBlock DataBlock

data DataBlock

readBlock :: Handle -> Integer -> IO B.ByteString
readBlock handle blockNum = do
  let pos = (blockNum + 1) * 0x200
  hSeek handle AbsoluteSeek pos
  B.hGet handle 0x200
