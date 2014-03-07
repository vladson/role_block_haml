require 'spec_helper'

feature 'haml blocks and roles' do

  context 'haml role' do
    before { visit '/'}

    scenario 'has role' do
      expect(page).to have_xpath '//div[contains(@data-role, "foo")]'
    end

    scenario 'text' do
      expect(page).to have_text('Text')
    end
  end

  context 'haml block' do
    scenario 'has block' do
      expect(page).to data_block('baz')
    end
  end
end