#!/usr/bin/env ruby
require 'pathname'
$:.unshift Pathname.new(__FILE__).realpath.join('../../lib') if $0 == __FILE__
require_relative '../lib/cheatsheet/option_parser'
require_relative '../lib/cheatsheet/version'

option_parser = CheatSheet::OptionParser.new(ARGV.dup)
options = nil
begin
  options = option_parser.parse
rescue CheatSheet::OptionParser::Help
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

require_relative '../lib/cheat_sheet'
if command
  result = CheatSheet.invoke(command, options)
  result.join if result.is_a?(Thread)
else
  #CheatSheet.start(options)
end
