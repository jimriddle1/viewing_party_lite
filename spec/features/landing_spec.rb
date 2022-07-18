# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Landing Page' do
  before :each do
    @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com', password: 'password123', password_confirmation: 'password123')
    @user2 = User.create!(name: 'NickT', email: 'NickT@jimar.com', password: 'password456', password_confirmation: 'password456')
  end

  it 'shows the title of the application' do
    visit root_path
    # save_and_open_page
    expect(page).to have_content('Welcome to Viewing Party Lite')
  end

  it 'has a button to create a new user' do
    visit root_path
    expect(page).to have_button('Create New User')
    click_button 'Create New User'
    expect(current_path).to eq(register_path)
  end

  it 'list existing users which links to an existing dashboards' do
    visit root_path
    expect(page).to have_link('Jimar')
    expect(page).to have_link('NickT')
    click_link 'Jimar'
    expect(current_path).to eq(user_path(@user1))
  end

  it 'have a link to go back to the home page on all pagess' do
    visit root_path
    expect(page).to have_link('Home')
    click_link 'Home'
    expect(current_path).to eq(root_path)
    click_link 'Jimar'
    expect(current_path).to eq(user_path(@user1))
    click_link 'Home'
    expect(current_path).to eq(root_path)
  end

  it 'has a link to login for a user' do
    visit root_path
    click_link 'Login'
    expect(current_path).to eq('/login')
    # save_and_open_page
    fill_in 'email', with: 'jimar@jimar.com'
    fill_in 'password', with: 'password123'
    click_button 'Log In'
    expect(current_path).to eq(user_path(@user1))
  end

  it 'has a link to login for a user - sad path' do
    visit root_path
    click_link 'Login'
    expect(current_path).to eq('/login')
    fill_in 'email', with: 'jimar@jimar.com'
    fill_in 'password', with: 'password456'
    click_button 'Log In'
    expect(current_path).to eq('/login')
    expect(page).to have_content("Invalid Credentials")
  end
end
