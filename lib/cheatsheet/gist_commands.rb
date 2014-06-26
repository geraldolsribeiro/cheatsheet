module CheatSheet
  class GistCommands
    attr_accessor :options, :file

    def initialize
      puts "Type 'help' for help with cheatsheet commands".c (94)

      @options = {
          :links => 'Working with links',
          :buttons => 'Interacting with buttons',
          :navigating => 'Moving between pages',
          :interacting => 'Interacting with forms',
          :scoping => 'Page interaction and scoping',
          :scripting => 'Carrying out scripting',
          :debugging => 'Commands for debugging',
          :querying => 'Lists all commands for querying source',
          :javascript => 'Working with asynchronous Javascript',
          :selectors => 'Css and xpath selectors for elements',
          :exit => 'To exit app'
      }

      @search_text = {
          :buttons => 'buttons',
          :links => 'buttons',
          :navigating => 'Navigating',
          :interacting => 'Interacting',
          :scoping => 'scoping',
          :debugging => 'Debugging',
          :querying => 'Querying',
          :scripting => 'Scripting',
          :javascript => 'Asynchronous',
          :selectors => 'CSS'
      }
      @file = CheatSheet::GistFile.new
    end

    def run
      while input = gets
        process_command(input)
      end
    end

    def validate_input(input)
      key = input.chomp.to_sym
      if (!@search_text.include?(key))
        puts ("Invalid command :#{input}Available options ...\n").c(91)
      end
    end

    def process_command(input)
      chomped_input = input.chomp
      key = chomped_input.to_sym
      validate_input(input)

      if @search_text.include? key
        @file.search_file(@search_text[key])
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