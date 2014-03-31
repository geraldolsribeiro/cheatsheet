require_relative '../lib/gist_file'
require_relative '../lib/gist_setup'
require 'open-uri'

class GistContent

  def gist_file
    GistFile.new
  end

  def fetch_content
    meta = GistSetup.new
    open(meta[:url]).read
  end

  def write_to_file
    gist_file.write_to_file fetch_content
  end

end