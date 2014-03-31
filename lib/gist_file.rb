class GistFile

  attr_accessor :file_name, :file_type

  def initialize
    meta = GistSetup.new
    @file_name = meta[:file_name]
    @file_type = meta[:file_type]
  end

  def read_file
    File.read(gist_file)
  end

  def path_to_file
    File.expand_path("./#{@file_name}.#{file_type}")
  end

  def destroy_file
    File.delete(path_to_file)
  end

  def write_to_file(content)
    create_file.write(content)
  end

  def create_file
    File.new(@file_name+".#{@file_type}", "w") unless File.file?(@file_name)
  end

end