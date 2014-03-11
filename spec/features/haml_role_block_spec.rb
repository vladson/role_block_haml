require 'spec_helper'

feature 'haml blocks and roles' do

  context 'haml role' do
    before { visit '/'}

    scenario 'has role' do
      expect(page).to have_role('foo')
    end

    scenario 'has double roles' do
      expect(page).to have_role('yiff')
    end
  end

  context 'haml block' do
    before {visit '/'}

    scenario 'has block' do
      expect(page).to have_block('baz')
    end
  end
end