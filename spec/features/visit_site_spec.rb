require 'rails_helper'

feature 'visit the site' do
  scenerio 'hello world' do
    visit '/'
    expect(page).to have_content 'Hello World'
  end
end