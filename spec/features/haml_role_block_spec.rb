require 'spec_helper'

feature 'haml blocks and roles' do
  before {visit '/'}

  context 'data role without shortcuts' do
    scenario 'has role' do
      expect(page).to have_xpath '//*[contains(@data-role, "foo")]'
    end

    scenario 'has double roles' do
      expect(page).to have_xpath '//*[contains(@data-role, "bar")]'
    end

    scenario 'has second in double roles' do
      expect(page).to have_xpath '//*[contains(@data-role, "baz")]'
    end

  end

  context 'data block without shortcuts' do
    scenario 'has block' do
      expect(page).to have_xpath '//*[contains(@data-block, "saz")]'
      end
    scenario 'has double blocks' do
      expect(page).to have_xpath '//*[contains(@data-block, "gaz")]'
      end
    scenario 'has second in double blocks' do
      expect(page).to have_xpath '//*[contains(@data-block, "haz")]'
    end
  end

  context 'role shortcut' do
    scenario 'has explicit role' do
      expect(page).to have_xpath '//*[contains(@data-role, "single_role")]'
    end

    scenario 'has explicit double roles' do
      expect(page).to have_xpath '//*[contains(@data-role, "second_role")]'
    end

    scenario 'has implicit role' do
      expect(page).to have_xpath '//*[contains(@data-role, "single_i_role")]'
    end

    scenario 'has explicit double roles' do
      expect(page).to have_xpath '//*[contains(@data-role, "second_i_role")]'
    end
  end

  context 'block shortcut' do
    scenario 'has explicit block' do
      expect(page).to have_xpath '//*[contains(@data-role, "single_block")]'
    end

    scenario 'has explicit double blocks' do
      expect(page).to have_xpath '//*[contains(@data-role, "dblock")]'
    end

    scenario 'has implicit block' do
      expect(page).to have_xpath '//*[contains(@data-role, "iblock")]'
    end

    scenario 'has explicit double blocks' do
      expect(page).to have_xpath '//*[contains(@data-role, "diblock")]'
    end
  end

end