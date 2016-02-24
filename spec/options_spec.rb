require 'rspec'
require_relative '../lib/cheatsheet/command_options'

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