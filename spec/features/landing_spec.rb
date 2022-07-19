# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Landing Page' do
  before :each do
    visit register_path
    fill_in 'name', with: 'NickT'
    fill_in 'email', with: 'NickT@sucks.com'
    fill_in 'password', with: 'password456'
    fill_in 'password_confirmation', with: 'password456'
    click_on 'Create User'

    visit register_path
    fill_in 'name', with: 'Jimar'
    fill_in 'email', with: 'jimar@jimar.com'
    fill_in 'password', with: 'password123'
    fill_in 'password_confirmation', with: 'password123'
    click_on 'Create User'
    # @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com', password: 'password123', password_confirmation: 'password123')
    # @user2 = User.create!(name: 'NickT', email: 'NickT@jimar.com', password: 'password456', password_confirmation: 'password456')
  end

  it 'shows the title of the application' do
    visit root_path
    # save_and_open_page
    expect(page).to have_content('Welcome to Viewing Party Lite')
  end

  it 'has a button to create a new user' do
    visit root_path
    click_link "Log out"
    expect(page).to have_button('Create New User')
    click_button 'Create New User'
    expect(current_path).to eq(register_path)
  end

  # it 'list existing users which links to an existing dashboards' do
  #   visit root_path
  #   expect(page).to have_link('Jimar')
  #   expect(page).to have_link('NickT')
  #   click_link 'Jimar'
  #   expect(current_path).to eq('/users/dashboard')
  # end
  #
  # it 'have a link to go back to the home page on all pagess' do
  #   visit root_path
  #   expect(page).to have_link('Home')
  #   click_link 'Home'
  #   expect(current_path).to eq(root_path)
  #   click_link 'Jimar'
  #   expect(current_path).to eq('/users/dashboard')
  #   click_link 'Home'
  #   expect(current_path).to eq(root_path)
  # end

  it 'has a link to login for a user' do
    visit root_path
    click_link "Log out"
    click_link 'Login'
    expect(current_path).to eq('/login')
    fill_in 'email', with: 'jimar@jimar.com'
    fill_in 'password', with: 'password123'
    # save_and_open_page
    click_button 'Log In'
    expect(current_path).to eq('/users/dashboard')
  end

  it 'has a link to login for a user - sad path' do
    visit root_path
    click_link "Log out"
    click_link 'Login'
    expect(current_path).to eq('/login')
    fill_in 'email', with: 'jimar@jimar.com'
    fill_in 'password', with: 'password456'
    click_button 'Log In'
    expect(current_path).to eq('/login')
    expect(page).to have_content("Invalid Credentials")
  end

  it 'allows me to log in and log out' do
    visit root_path
    expect(page).to_not have_link('Login')
    expect(page).to_not have_button('Create New User')
    click_link 'Log out'

    expect(current_path).to eq(root_path)
    expect(page).to have_link('Login')
    expect(page).to have_button('Create New User')
  end

  it 'shows emails of users that are logged in' do
    visit root_path
    expect(page).to have_content('NickT@sucks.com')
    expect(page).to have_content('jimar@jimar.com')

  end

  it 'tells me that i need to be logged in before going to my dashboard' do
    visit root_path
    click_link "Log out"
    visit '/users/dashboard'
    expect(current_path).to eq(root_path)
    expect(page).to have_content('You must be logged in to see a dashboard')
  end
end
