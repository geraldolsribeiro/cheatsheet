require 'rspec'
require_relative '../lib/cheatsheet/gist_commands'
require_relative '../lib/cheatsheet/command_options'
require_relative '../lib/cheatsheet/gist_file'
require_relative '../lib/cheatsheet/gist_setup'

class CommandsSpec

  describe 'gist commands' do

    let(:commands) { commands = CheatSheet::GistCommands.new }

    it 'should have the correct file name' do
      expect(commands.file.file_name).to eq 'capybara_cheat_sheet'
    end

    it 'should have the correct command list' do
      expect(commands.options.length).to eq 11
      expect(commands.options.keys.length).to eq 11
      expect(commands.options.keys.first.to_s).to eq 'links'
      expect(commands.options.keys[4].to_s).to eq 'scoping'
      expect(commands.options.keys.last.to_s).to eq 'exit'
    end

    it 'should ensure that a user does not process invalid commands' do
      command_name = 'yo!'
      message = "\e[0;94mType 'help' for help with cheatsheet commands\e[0m\n\e[0;91mInvalid command :yo!Available options ...\n\e[0m\n\e[0;96m    links\e[0m \e[0;92m    Working with links\e[0m\n\e[0;96m    buttons\e[0m \e[0;92m    Interacting with buttons\e[0m\n\e[0;96m    navigating\e[0m \e[0;92m    Moving between pages\e[0m\n\e[0;96m    interacting\e[0m \e[0;92m    Interacting with forms\e[0m\n\e[0;96m    scoping\e[0m \e[0;92m    Page interaction and scoping\e[0m\n\e[0;96m    scripting\e[0m \e[0;92m    Carrying out scripting\e[0m\n\e[0;96m    debugging\e[0m \e[0;92m    Commands for debugging\e[0m\n\e[0;96m    querying\e[0m \e[0;92m    Lists all commands for querying source\e[0m\n\e[0;96m    javascript\e[0m \e[0;92m    Working with asynchronous Javascript\e[0m\n\e[0;96m    selectors\e[0m \e[0;92m    Css and xpath selectors for elements\e[0m\n\e[0;96m    exit\e[0m \e[0;92m    To exit app\e[0m\n"
      expect { commands.process_command(command_name) }.to output(message).to_stdout
    end

    it 'should list all available command options' do
      options = "\e[0;94mType 'help' for help with cheatsheet commands\e[0m\n\e[0;96m    links\e[0m \e[0;92m    Working with links\e[0m\n\e[0;96m    buttons\e[0m \e[0;92m    Interacting with buttons\e[0m\n\e[0;96m    navigating\e[0m \e[0;92m    Moving between pages\e[0m\n\e[0;96m    interacting\e[0m \e[0;92m    Interacting with forms\e[0m\n\e[0;96m    scoping\e[0m \e[0;92m    Page interaction and scoping\e[0m\n\e[0;96m    scripting\e[0m \e[0;92m    Carrying out scripting\e[0m\n\e[0;96m    debugging\e[0m \e[0;92m    Commands for debugging\e[0m\n\e[0;96m    querying\e[0m \e[0;92m    Lists all commands for querying source\e[0m\n\e[0;96m    javascript\e[0m \e[0;92m    Working with asynchronous Javascript\e[0m\n\e[0;96m    selectors\e[0m \e[0;92m    Css and xpath selectors for elements\e[0m\n\e[0;96m    exit\e[0m \e[0;92m    To exit app\e[0m\n"
      expect { commands.output_options }.to output(options).to_stdout
    end

    it 'should validate input and show available commands when the typed command does not exist' do
      input = 'yo'
      results = "\e[0;94mType 'help' for help with cheatsheet commands\e[0m\n\e[0;91mInvalid command :yoAvailable options ...\n\e[0m\n\e[0;96m    links\e[0m \e[0;92m    Working with links\e[0m\n\e[0;96m    buttons\e[0m \e[0;92m    Interacting with buttons\e[0m\n\e[0;96m    navigating\e[0m \e[0;92m    Moving between pages\e[0m\n\e[0;96m    interacting\e[0m \e[0;92m    Interacting with forms\e[0m\n\e[0;96m    scoping\e[0m \e[0;92m    Page interaction and scoping\e[0m\n\e[0;96m    scripting\e[0m \e[0;92m    Carrying out scripting\e[0m\n\e[0;96m    debugging\e[0m \e[0;92m    Commands for debugging\e[0m\n\e[0;96m    querying\e[0m \e[0;92m    Lists all commands for querying source\e[0m\n\e[0;96m    javascript\e[0m \e[0;92m    Working with asynchronous Javascript\e[0m\n\e[0;96m    selectors\e[0m \e[0;92m    Css and xpath selectors for elements\e[0m\n\e[0;96m    exit\e[0m \e[0;92m    To exit app\e[0m\n"
      expect { commands.validate_input input }.to output(results).to_stdout
    end
  end
end

class OptionsSpec

  describe 'gist command options' do
    let(:defaults) { defaults = CheatSheet::CommandOptions::DEFAULTS }
    let(:options) { options = CheatSheet::CommandOptions::OPTIONS }
    let(:search_keys) { options = CheatSheet::CommandOptions::SEARCH_KEYS }

    it 'should have the right description text for each of the commands' do
      expect(defaults[0]).to eq('exit')
      expect(defaults[1]).to eq('help')
    end

    it 'should have the right descriptions for option text' do
      expect(options[:links]).to eq('Working with links')
      expect(options[:buttons]).to eq('Interacting with buttons')
      expect(options[:scripting]).to eq('Carrying out scripting')
      expect(options[:debugging]).to eq('Commands for debugging')
      expect(options[:querying]).to eq('Lists all commands for querying source')
      expect(options[:exit]).to eq('To exit app')
    end

    it 'should have the right description text for search key text' do
      expect(search_keys[:buttons]).to eq('buttons')
      expect(search_keys[:links]).to eq('buttons')
      expect(search_keys[:navigating]).to eq('Navigating')
      expect(search_keys[:interacting]).to eq('Interacting')
      expect(search_keys[:scoping]).to eq('scoping')
      expect(search_keys[:selectors]).to eq('CSS')
      expect(search_keys[:debugging]).to eq('Debugging')
    end
  end
end