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
      expect(page).to have_xpath '//*[contains(@data-block, "single_block")]'
    end

    scenario 'has explicit double blocks' do
      expect(page).to have_xpath '//*[contains(@data-block, "dblock")]'
    end

    scenario 'has implicit block' do
      expect(page).to have_xpath '//*[contains(@data-block, "iblock")]'
    end

    scenario 'has implicit double blocks' do
      expect(page).to have_xpath '//*[contains(@data-block, "second_impl_block")]'
    end
  end

  context 'with mixed order' do
    scenario 'and first_role block is visible' do
      expect(page).to have_xpath '//*[contains(@data-block, "second_block")]'
    end

    scenario 'and first_role role is visible' do
      expect(page).to have_xpath '//*[contains(@data-role, "first_role")]'
    end

    scenario 'and first_block block is visible' do
      expect(page).to have_xpath '//*[contains(@data-block, "first_block")]'
    end

    scenario 'and first_block role is visible' do
      expect(page).to have_xpath '//*[contains(@data-role, "second_role")]'
    end
  end

end