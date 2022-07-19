# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movie Results Page' do
  it 'Shows top 20 movies', :vcr do

    visit register_path
    fill_in 'name', with: 'Jamar'
    fill_in 'email', with: 'Jamar@sucks.com'
    fill_in 'password', with: 'password123'
    fill_in 'password_confirmation', with: 'password123'
    click_on 'Create User'

    visit "/users/discover"

    click_button 'Top Rated Movies'
    expect(current_path).to eq("/users/movies")

    expect(page).to have_content('Movies:')
    expect(page).to have_content('Title: The Shawshank Redemption')
    expect(page).to have_content('Average Vote: 8.7')

    expect(page).to have_link('The Shawshank Redemption')

    expect(page).to_not have_content('Title: Ariel')
    expect(page).to_not have_content('Average Vote: 6.8')
  end

  it 'can search for a movie', :vcr do
    visit register_path
    fill_in 'name', with: 'Jamar'
    fill_in 'email', with: 'Jamar@sucks.com'
    fill_in 'password', with: 'password123'
    fill_in 'password_confirmation', with: 'password123'
    click_on 'Create User'

    visit "/users/discover"

    fill_in('search', with: 'Fight Club')
    click_button 'Search for Movie'

    expect(current_path).to eq("/users/movies")

    expect(page).to have_content('Title: Fight Club')
    expect(page).to have_content('Average Vote: 8.4')
  end

  it 'has a button to return to discover page', :vcr do
    visit register_path
    fill_in 'name', with: 'Jamar'
    fill_in 'email', with: 'Jamar@sucks.com'
    fill_in 'password', with: 'password123'
    fill_in 'password_confirmation', with: 'password123'
    click_on 'Create User'

    visit "/users/movies"

    click_button('Discover Page')

    expect(current_path).to eq("/users/discover")
  end
end
