require 'spec_helper'

feature 'haml blocks and roles' do

  context 'haml role' do
    before { visit '/'}

    scenario 'has role' do
      expect(page).to have_xpath '//*[contains(@data-role, "foo")]'
    end

    scenario 'has role' do
      expect(page).to have_role('foo')
    end

    scenario 'no role' do
      expect(page).to have_role('bar')
    end

    scenario 'text' do
      expect(page).to have_text('Text')
    end
  end

  context 'haml block' do
    before {visit '/'}

    scenario 'has block' do
      expect(page).to have_block('baz')
    end
  end
end