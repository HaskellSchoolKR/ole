module OLE.BBAT where

import           Data.Binary.Get
import qualified Data.ByteString as B
import           Data.Int
import           Data.Word
import           OLE
import           System.IO

type Entry = Int32

bbat :: Handle -> [Word32] -> IO [Entry]
bbat handle members = do
  blocks <- traverse (readBlock handle) members
  let bytes = B.concat blocks
  return (splitBy4Bytes bytes)

splitBy4Bytes :: B.ByteString -> [Entry]
splitBy4Bytes bytes =
  if B.length bytes == 0
    then []
    else start : splitBy4Bytes rest
  where
    start = runGet getInt32le (B.fromStrict (B.take 4 bytes))
    rest = B.drop 4 bytes

chain :: [Entry] -> Int32 -> [Entry]
chain table start = start : go table start []
  where
    go table index result =
      let
        entry = table !! (fromIntegral index)
      in
        case entry of
            (-2) -> result
            _    -> [entry] ++ go table entry result
