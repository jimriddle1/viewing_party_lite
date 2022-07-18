# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Registration Page' do
  it 'can create a new user ' do
    visit register_path
    fill_in 'name', with: 'Jamar'
    fill_in 'email', with: 'Jamar@sucks.com'
    fill_in 'password', with: 'password123'
    fill_in 'password_confirmation', with: 'password123'
    click_on 'Create User'
    expect(current_path).to eq(user_path(User.last.id))
    expect(page).to have_content("Welcome, #{User.last.email}!")
    # save_and_open_page
  end

  it 'can create a new user SP 1' do
    visit register_path
    # fill_in 'name', with: 'Jamar'
    fill_in 'email', with: 'Jamar@sucks.com'
    fill_in 'password', with: 'password123'
    fill_in 'password_confirmation', with: 'password123'
    click_on 'Create User'
    # save_and_open_page
    expect(current_path).to eq(register_path)
    expect(page).to have_content("Invalid Credentials")
    # save_and_open_page
  end

  it 'can create a new user SP 2' do
    visit register_path
    fill_in 'name', with: 'Jamar'
    # fill_in 'email', with: 'Jamar@sucks.com'
    fill_in 'password', with: 'password123'
    fill_in 'password_confirmation', with: 'password123'
    click_on 'Create User'
    expect(current_path).to eq(register_path)
    expect(page).to have_content("Invalid Credentials")
    # save_and_open_page
  end

  it 'can create a new user SP 3' do
    visit register_path
    fill_in 'name', with: 'Jamar'
    fill_in 'email', with: 'Jamar@sucks.com'
    # fill_in 'password', with: 'password123'
    # fill_in 'password_confirmation', with: 'password123'
    click_on 'Create User'
    expect(current_path).to eq(register_path)
    expect(page).to have_content("Invalid Credentials")
    # save_and_open_page
  end

  it 'can create a new user SP 4' do
    visit register_path
    fill_in 'name', with: 'Jamar'
    fill_in 'email', with: 'Jamar@sucks.com'
    fill_in 'password', with: 'password123'
    # fill_in 'password_confirmation', with: 'password456'
    click_on 'Create User'
    expect(current_path).to eq(register_path)
    expect(page).to have_content("Invalid Credentials")
    # save_and_open_page
  end

  it 'can create a new user SP 5' do
    visit register_path
    fill_in 'name', with: 'Jamar'
    fill_in 'email', with: 'Jamar@sucks.com'
    # fill_in 'password', with: 'password123'
    fill_in 'password_confirmation', with: 'password123'
    click_on 'Create User'
    expect(current_path).to eq(register_path)
    expect(page).to have_content("Invalid Credentials")
    # save_and_open_page
  end

  it 'can create a new user SP 6' do
    visit register_path
    fill_in 'name', with: 'Jamar'
    fill_in 'email', with: 'Jamar@sucks.com'
    fill_in 'password', with: 'password123'
    fill_in 'password_confirmation', with: 'password456'
    click_on 'Create User'
    expect(current_path).to eq(register_path)
    expect(page).to have_content("Invalid Credentials")
    # save_and_open_page
  end


end
