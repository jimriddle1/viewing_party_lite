# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:user_parties) }
    it { should have_many(:parties).through(:user_parties) }
  end

  describe 'passwords' do
    it { should validate_uniqueness_of(:email)}
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:password_digest)}
    it { should have_secure_password}
    it 'has the right attrs for a new user' do
      user = User.create(name: 'Meg', email: 'meg@test.com', password: 'password123', password_confirmation: 'password123')
      # binding.pry
      expect(user).to_not have_attribute(:password)
      expect(user.password_digest).to_not eq('password123')
    end
  end
end
