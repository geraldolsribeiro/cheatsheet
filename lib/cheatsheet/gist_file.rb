module CheatSheet
  class GistFile

    attr_accessor :file_name, :file_type

    def initialize
      meta = CheatSheet::GistSetup.new.gist_meta
      @file_name = meta[:file_name]
      @file_type = meta[:file_type]
    end

    def read_file
      File.read(path_to_file)
    end

    def path_to_file
      File.expand_path("./#{@file_name}.#{@file_type}")
    end

    def destroy_file
      File.delete(path_to_file)
    end

    def write_to_file(content)
      create_file.write(content)
    end

    def create_file
      File.new(@file_name+".#{@file_type}", "w") if is_empty
    end

    def current_body_text(text)
      puts read_file.match(/^=[^\n]*#{text}.*?(?=\n=)/m)
      puts("\n")
    end

    def search_file(text)
      current_body_text(text)
    end

    def is_empty?
      read_file == nil
    end
  end

end


