#!/usr/bin/env ruby
require 'pathname'
$:.unshift Pathname.new(__FILE__).realpath.join('../../lib') if $0 == __FILE__
require 'optparse'
require "cheatsheet/version"

option_parser = OptionParser.new(ARGV.dup)
options = nil
begin
  options = option_parser.parse
rescue OptionParser::Help
  exit
rescue => e
  puts e
  exit!
end

command = options.delete(:command)
no_logo = options.delete(:'no-logo')

if !no_logo && !command
  print "\e[31m"
  puts %q{
╔═╗┬ ┬┌─┐┌─┐┌┬┐  ╔═╗┬ ┬┌─┐┌─┐┌┬┐
║  ├─┤├┤ ├─┤ │   ╚═╗├─┤├┤ ├┤  │
╚═╝┴ ┴└─┘┴ ┴ ┴   ╚═╝┴ ┴└─┘└─┘ ┴
                                       }.
           gsub(/^\n/, '') + "v#{CheatSheet::VERSION}".rjust(10) + "\n\n"
  print "\e[0m"
end

require_relative '../lib/cheatsheet/gist_core'
app = CheatSheet::GistCore.new
app.start