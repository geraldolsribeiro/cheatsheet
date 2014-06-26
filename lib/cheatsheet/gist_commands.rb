module CheatSheet
  class GistCommands
    attr_accessor :options, :file

    def initialize
      puts "Type 'help' for help with cheatsheet commands".c (94)

      @options = CheatSheet::CommandOptions::OPTIONS
      @defaults = CheatSheet::CommandOptions::DEFAULTS
      @search_text = CheatSheet::CommandOptions::SEARCH_KEYS
      @file = CheatSheet::GistFile.new
    end

    def run
      while input = gets
        process_command input
      end
    end

    def validate_input(input)
      chomped_input = input.chomp
      key = chomped_input.to_sym

      if !@search_text.include? key
        process_defaults chomped_input
        process_other(chomped_input, input)
      end
    end

    def process_defaults(chomped_input)
      if @defaults.include? chomped_input
        chomped_input == 'help' ? output_options : exit
      end
    end

    def process_other(chomped_input, input)
      if !@defaults.include? chomped_input
        puts ("Invalid command :#{input}Available options ...\n").c(91)
        output_options
      end
    end

    def process_command(input)
      chomped_input = input.chomp
      key = chomped_input.to_sym
      validate_input input

      if @search_text.include? key
        @file.search_file @search_text[key]
      end
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