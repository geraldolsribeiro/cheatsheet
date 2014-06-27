#!/usr/bin/env ruby
require 'pathname'
$:.unshift Pathname.new(__FILE__).realpath.join('../../lib') if $0 == __FILE__
require 'optparse'
require 'cheatsheet/version'

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
        __               __       __              __
  _____/ /_  ___  ____ _/ /______/ /_  ___  ___  / /_
 / ___/ __ \/ _ \/ __ `/ __/ ___/ __ \/ _ \/ _ \/ __/
/ /__/ / / /  __/ /_/ / /_(__  ) / / /  __/  __/ /_
\___/_/ /_/\___/\__,_/\__/____/_/ /_/\___/\___/\__/
                                       }.
           gsub(/^\n/, '') + "v#{CheatSheet::VERSION}".rjust(10) + "\n\n"
  print "\e[0m"
end

require 'open-uri'
require_relative '../lib/cheatsheet/command_options'
require_relative '../lib/cheatsheet/gist_core'
require_relative '../lib/cheatsheet/gist_commands'
require_relative '../lib/cheatsheet/gist_file'
require_relative '../lib/cheatsheet/gist_setup'

CheatSheet::GistCore.new.start

