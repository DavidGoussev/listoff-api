require 'rails_helper'

feature 'User creates item' do
  scenario 'Successfully' do
    visit '/items/new'
    fill_in 'name', with: "feed dog before going to sleep."
    click_button 'submit'
  end
end
