module CheatSheet
  require_relative '../../lib/cheatsheet/gist_commands'
  class GistCore

    def start
      CheatSheet::GistCommands.new.run
    end
  end
end
