require 'ostruct'
require 'date'

module CheatSheet
  class GistCommands

    def process_command
      while input = gets
        if input.chomp == ':exit'
          exit
        end
        process_options(input)
      end
    end

    def process_options(option)

    end
  end

  def output_options
    puts "Options:\
         "
    @options.marshal_dump.each do |name, val|
      puts "  #{name} = #{val}"
    end
  end
end
