require 'open-uri'

module CheatSheet
  class GistContent

    def gist_file
      CheatSheet::GistFile.new
    end

    def fetch_content
      meta = CheatSheet::GistSetup.new.gist_meta
      open(meta[:url]).read
    end

    def write_to_file
      gist_file.write_to_file fetch_content
    end
  end

end
