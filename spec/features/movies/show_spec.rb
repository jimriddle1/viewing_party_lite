# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movies Detail/Show Page' do
  it 'should have a button for creating a viewing party', :vcr do
    visit register_path
    fill_in 'name', with: 'Jamar'
    fill_in 'email', with: 'Jamar@sucks.com'
    fill_in 'password', with: 'password123'
    fill_in 'password_confirmation', with: 'password123'
    click_on 'Create User'
    visit "/users/movies/550"

    click_button('Create Viewing Party')

    expect(current_path).to eq("/users/movies/550/viewing-party/new")
  end

  it 'has a return to movie discovery page button', :vcr do
    visit register_path
    fill_in 'name', with: 'Jamar'
    fill_in 'email', with: 'Jamar@sucks.com'
    fill_in 'password', with: 'password123'
    fill_in 'password_confirmation', with: 'password123'
    click_on 'Create User'
    visit "/users/movies/550"

    click_button('Discover Page')

    expect(current_path).to eq("/users/discover")
  end

  it 'Shows Movie Details', :vcr do
    visit register_path
    fill_in 'name', with: 'Jamar'
    fill_in 'email', with: 'Jamar@sucks.com'
    fill_in 'password', with: 'password123'
    fill_in 'password_confirmation', with: 'password123'
    click_on 'Create User'

    visit "/users/movies/550"
    # save_and_open_page

    expect(page).to have_content('Title: Fight Club')
    expect(page).to have_content('Vote Average: 8.4')
    expect(page).to have_content('Runtime: 2:19')
    expect(page).to have_content('Description: A ticking-time-bomb insomniac and a slippery soap salesman')
    expect(page).to have_content('Cast Members:')
    expect(page).to have_content('Edward Norton, Brad Pitt, Helena Bonham Carter')
    expect(page).to have_content('Total Reviews: 7')
    expect(page).to have_content('Author: Goddard')
    expect(page).to have_content('Pretty awesome movie. It shows what one crazy person can convince other crazy people to do')

    expect(page).to_not have_content('Christina Cabot')
  end

  it 'does not allow me to create a viewing party unless i am logged in', :vcr do
    visit "/users/movies/550"
    click_button "Create Viewing Party"

    expect(current_path).to eq("/users/movies/550")
    expect(page).to have_content("You have to be logged in to create a viewing party")
    # save_and_open_page
  end
end
