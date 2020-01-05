require 'bundler'
require 'pry'
Bundler.require

module Concerns
end

require_all 'lib'
require_relative '../lib/concerns/findable'
