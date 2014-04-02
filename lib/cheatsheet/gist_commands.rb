require 'ostruct'
require 'date'

module CheatSheet
  class GistCommands

    def initialize(arguments, stdin)
      @arguments = arguments
      @stdin = stdin

      @options = OpenStruct.new
      @options.verbose = false
      @options.quiet = false
    end

    def run
      output_options
    end

    def process_options
      @options.verbose = false if @options.quiet
    end

    def parsed_options?
      opts = OptionParser.new (ARGV)
      opts.on(':version', '--version') { CheatSheet::VERSION; exit 0 }
      opts.on(':help', '--help') { "" }
      opts.parse!(@arguments) rescue return false

      process_options
      true
    end

    def arguments_valid?
      true if @arguments.length == 1
    end

    def process_arguments
      # TO DO - place in local vars, etc
    end

    def process_command
      # TO DO - do whatever this app does
    end

    def output_options
      puts "Options:\
           "
      @options.marshal_dump.each do |name, val|
        puts "  #{name} = #{val}"
      end
    end
  end
end
