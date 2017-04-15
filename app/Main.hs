{-# LANGUAGE OverloadedStrings #-}

module Main where

import Web.Scotty

import Data.Monoid (mconcat)

main = scotty 80 $ do
  get "/:word" $ do
    beam <- param "word"
    html $ mconcat ["<h1>Scotty, ", beam, " me up!</h1>"]