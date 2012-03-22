require 'rubygems'
require 'bundler'
require 'yaml'
require 'digest'

Bundler.require

require './core'
require './app/models/hacker'
require './app/models/target'
run Core