require 'ostruct'
require 'date'

module CheatSheet
  class GistCommands
    attr_accessor :options

    def initialize
      puts "Press ':help' for help with cheatsheet commands".c (94)
      @options = {
          :links => "Working with links",
          :buttons => "Interacting with buttons",
          :navigating => "Moving between pages",
          :interactions => "Interacting with forms",
          :scoping => "Page interaction and scoping",
          :scripting => "Carrying out scripting",
          :debugging => "Lists all commands",
          :javascript => "Working with asynchronous Javascript",
          :selectors => "Css and xpath selectors for elements",
          :exit => "To exit app"}
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

      if input.chomp == ':help'
        output_options
      end

      puts "Invalid command use ':help' to view commands".c(95)
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