require 'rails_helper'

feature 'view guides' do

  scenario 'make new' do
      visit '/guides/new'
      within("#create") do
        fill_in 'name', :with => 'Nathan Tseng'
        fill_in 'location', :with => 'Hong Kong'
        click_on 'Submit'
      end
      #expect(page).to have_content 'Invalid email/password'
      expect(current_path).to eq('/guides')
      #expect(page).to have_content 'Success'
  end
end