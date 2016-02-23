require 'rspec'

require_relative '../lib/cheatsheet/gist_file'

describe 'gist file' do

  let(:gist_file) { gist_file = CheatSheet::GistFile.new }

  it 'should locate correct file name with correct type to read' do
    expect(gist_file.file_name).to eq 'capybara_cheat_sheet'
    expect(gist_file.file_type).to eq 'txt'
  end


  it 'should extract the correct path to file' do
    expect(gist_file.path_to_file).to include "cheatsheet/capybara_cheat_sheet.txt"
  end


  it 'should return the correct items given the search text' do
    search_text = 'Interacting with form'
    results = "=Interacting with forms=\n    fill_in('First Name', :with => 'John')\n    fill_in('Password', :with => 'Seekrit')\n    fill_in('Description', :with => 'Really Long Text…')\n    choose('A Radio Button')\n    check('A Checkbox')\n    uncheck('A Checkbox')\n    attach_file('Image', '/path/to/image.jpg')\n    select('Option', :from => 'Select Box')\n\n"
    expect { gist_file.search_file(search_text) }.to output(results).to_stdout
  end
end