require 'ostruct'
require 'date'

module CheatSheet
  class GistCommands
    attr_accessor :options, :file

    def initialize
      puts "Press ':help' for help with cheatsheet commands".c (94)
      @options = {
          :links => "Working with links",
          :buttons => "Interacting with buttons",
          :navigating => "Moving between pages",
          :interacting => "Interacting with forms",
          :scoping => "Page interaction and scoping",
          :scripting => "Carrying out scripting",
          :debugging => "Lists all commands",
          :querying => "Lists all commands",
          :javascript => "Working with asynchronous Javascript",
          :selectors => "Css and xpath selectors for elements",
          :exit => "To exit app"
      }
      @file = CheatSheet::GistFile.new
    end

    def run
      while input = gets
        process_command(input)
      end
    end

    def process_command(input)
      if input.chomp == ':exit'
        exit
      end

      if input.chomp == ':buttons' || input.chomp == ':links'
        @file.search_file("buttons")
      end

      if input.chomp == ':navigating'
        @file.search_file("Navigating")
      end

      if input.chomp == ':interacting'
        @file.search_file("Interacting")
      end

      if input.chomp == ':scoping'
        @file.search_file("scoping")
      end

      if input.chomp == ':debugging'
        @file.search_file("Debugging")
      end

      if input.chomp == ':querying'
        @file.search_file("Querying")
      end


      if input.chomp == ':javascript'
        @file.search_file("Javascript")
      end

      if input.chomp == ':selectors'
        @file.search_file("xpath")
      end

      if input.chomp == ':scripting'
        @file.search_file("Scripting")
      end

      if input.chomp == ':interacting'
        @file.search_file("Interacting")
      end

      if input.chomp == ':help'
        output_options
      end

      #else
      #  puts "Invalid command use ':help' to view commands".c(95)
      #end
    end

    def output_options
      @options.each do |option|
        option_key = option.first
        value = @options[option_key].to_s
        puts "#{option_key.to_s.indent(4).c(96)} #{value.indent(4).c(92)}"
      end
    end
  end
end

class String
  def c(*codes)
    codes = codes.flatten.map { |code|
      case code
        when String, Symbol
          CheatSheet.config[:color][code.to_sym] rescue nil
        else
          code
      end
    }.compact.unshift(0)
    "\e[#{codes.join(';')}m#{self}\e[0m"
  end

  def indent(count, char = ' ')
    (char * count) + gsub(/(\n+)/) { |m| m + (char * count) }
  end

  def trim_indent
    lines = self.split("\n")
    unindent = self.split("\n").select { |s| s !~ /^\s$/ }.map { |s| s.index(/[^\s]/) || 0 }.min
    lines.map { |s| s.gsub(/^#{' ' * unindent}/, '') }.join("\n")
  end
end