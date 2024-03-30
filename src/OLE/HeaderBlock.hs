{-# LANGUAGE OverloadedStrings #-}

module OLE.HeaderBlock where

import           Data.Binary
import           Data.Binary.Get
import qualified Data.ByteString as B

data HeaderBlock = HeaderBlock
  { magicID                 :: B.ByteString
  , numberOfBBATdepot       :: Word32
  , startBlockOfProperty    :: Word32
  , startBlockOfSBAT        :: Word32
  , numberOfSBATdepot       :: Word32
  , arrayOfBBATdepotMembers :: [Word32]
  } deriving (Show)

instance Binary HeaderBlock where
  get = do
    magic <- getByteString 8
    if magic /= "\xd0\xcf\x11\xe0\xa1\xb1\x1a\xe1"
      then fail "Invalid Magic ID"
      else do
        skip 36
        bbatNum <- getWord32le
        property <- getWord32le
        skip 8
        sbatStart <- getWord32le
        sbatNum <- getWord32le
        skip 8
        members <- sequence (replicate (fromIntegral bbatNum) getWord32le)
        return
          (HeaderBlock magic bbatNum property sbatStart sbatNum members)

  put = undefined
