{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExtendedDefaultRules #-}
module MyAntigen where

import Antigen (
                -- Rudimentary imports
                AntigenConfiguration (..)
              , bundle
              , antigen
                -- If you want to source a bit trickier plugins
              , ZshPlugin (..)
              , antigenSourcingStrategy
              , filePathsSourcingStrategy
              )
import Shelly (shelly)

bundles =
  [ 
  --bundle "Tarrasch/zsh-functional"
    bundle "Tarrasch/zsh-bd"
  , bundle "zsh-users/zsh-history-substring-search"
  , bundle "zsh-users/zsh-syntax-highlighting"
  , (bundle "jimeh/tmuxifier") { sourcingStrategy = antigenSourcingStrategy }
  , (bundle "robbyrussell/oh-my-zsh")
     { sourcingLocations = [ "plugins/osx"
                           ] }


  -- If you use a plugin that doesn't have a *.plugin.zsh file. You can set a
  -- more liberal sourcing strategy.
  --
  -- , (bundle "some/stupid-plugin") { sourcingStrategy = antigenSourcingStrategy }

  -- If you use a plugin that has sub-plugins. You can specify that as well
  --
  -- NOTE: If you want to use oh-my-zsh for real (please don't), you still need
  -- to set the $ZSH env var manually.
  -- , (bundle "robbyrussell/oh-my-zsh")
  --    { sourcingLocations = [ "plugins/wd"
  --                          , "plugins/colorize"] }

  -- Sourcing a list of files
  -- , (bundle "alfredodeza/zsh-plugins")
  --    { sourcin/*

  -- Alternatively, this way will give you the same result
  -- , (bundle "alfredodeza/zsh-plugins")
  --    { sourcingStrategy = antigenSourcingStrategy
  --    , sourcingLocations = [ "vi"
  --                          , "pytest"
  --                          ] }

  -- vvv    Add your plugins here    vvv
  
  ]



config = AntigenConfiguration bundles

main :: IO ()
main = shelly $ antigen config
