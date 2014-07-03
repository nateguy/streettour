require 'rails_helper'

feature 'log in' do
  scenario 'Form exists' do
    visit '/'
    expect(find('#login')).to have_button('Submit')
  end

  scenario 'signin' do
    visit '/'
    within("#login") do
      fill_in 'username', :with => 'nateguy@gmail.com'
      fill_in 'password', :with => '1234'
      click_on 'Submit'
    end
    #expect(page).to have_content 'Invalid email/password'
    expect(current_path).to eq('/profile')
    expect(page).to have_content 'Success'
  end
end