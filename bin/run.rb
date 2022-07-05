#!/usr/bin/env ruby

require './lib/input_parser.rb'
require './lib/houston.rb'

input = InputParser.new(ARGV[0])
Houston.new(input: input.data).call
