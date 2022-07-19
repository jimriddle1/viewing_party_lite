# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Discover Page' do
  it 'discover button' do
    visit register_path
    fill_in 'name', with: 'Jamar'
    fill_in 'email', with: 'Jamar@sucks.com'
    fill_in 'password', with: 'password123'
    fill_in 'password_confirmation', with: 'password123'
    click_on 'Create User'


    visit user_path(User.last.id)

    click_button 'Discover Movies'
    expect(current_path).to eq("/users/discover")
  end

  it 'has a button to see top 20 movies' do
    @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com')

    visit "/users/#{@user1.id}/discover"
    expect(page).to have_button('Top Rated Movies')
  end
end
