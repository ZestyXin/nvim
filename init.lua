-- Init

local vim_script = require('vim')
local utils = require('utils')

local keybindings = require('keybindings')
local options = require('options')
local plugins = require('plugins')
local cmds    = require('cmds')

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim_script.init()

utils.config.set_options(options)
utils.config.set_cmds(cmds)

utils.loader.load(plugins)

utils.config.set_keybindings(keybindings)

