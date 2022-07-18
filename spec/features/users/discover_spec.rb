# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Discover Page' do
  it 'discover button' do
    binding.pry
    @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com')
    @user2 = User.create!(name: 'NickT', email: 'NickT@jimar.com')

    visit user_path(@user1.id)

    click_button 'Discover Movies'
    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end

  it 'has a button to see top 20 movies' do
    @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com')

    visit "/users/#{@user1.id}/discover"
    expect(page).to have_button('Top Rated Movies')
  end
end
