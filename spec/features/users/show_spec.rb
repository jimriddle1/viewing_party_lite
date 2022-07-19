# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Show Page' do
  it 'show me a users dashboard ' do
    visit register_path
    fill_in 'name', with: 'Jamar'
    fill_in 'email', with: 'Jamar@sucks.com'
    fill_in 'password', with: 'password123'
    fill_in 'password_confirmation', with: 'password123'
    click_on 'Create User'

    visit register_path
    fill_in 'name', with: 'Jamar2'
    fill_in 'email', with: 'Jamar@sucks2.com'
    fill_in 'password', with: 'password123'
    fill_in 'password_confirmation', with: 'password123'
    click_on 'Create User'

    visit "/users/dashboard"

    # save_and_open_page


    expect(page).to have_content("Jamar2's Dashboard")
    expect(page).to_not have_content("Jamar's Dashboard")

    expect(page).to have_link('Viewing Parties')
    expect(page).to have_button('Discover Movies')
  end
end
