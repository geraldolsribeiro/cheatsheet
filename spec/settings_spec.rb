require 'rspec'
require_relative '../lib/cheatsheet/gist_setup'

class SettingsSpec

  describe 'cheatsheet settings ' do

    let(:meta) { meta = CheatSheet::GistSetup::GIST_META }

    it 'should match the correct file type' do
      expect(meta[:file_type]).to eq 'txt'
    end

    it 'should match the correct source url' do
      expect(meta[:url]).to eq 'https://gist.githubusercontent.com/katmutua/9899763/raw/37149fa1ddccc8778af64452942463ff145d103d/capybara+cheat+sheet'
    end

    it 'should match the correct file name to fetch rules' do
      expect(meta[:file_name]).to eq 'capybara_cheat_sheet'
    end
  end
end