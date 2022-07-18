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
  end
end
