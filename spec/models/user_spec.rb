require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    it 'should create a new user when all fields are added' do
      @user = User.new(
        name: 'name',
        email: 'example@email.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user).to be_valid
    end

    it 'should not be valid without an email' do
      @user = User.new(
        name: 'name',
        email: nil,
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user).to_not be_valid
    end

    it 'should not be valid without a password' do
      @user = User.new(
        name: 'name',
        email: 'example@email.com',
        password: nil,
        password_confirmation: 'password'
      )
      expect(@user).to_not be_valid
    end

    it 'should not be valid without a password confirmation' do
      @user = User.new(
        name: 'name',
        email: 'example@email.com',
        password: 'password',
        password_confirmation: nil
      )
      expect(@user).to_not be_valid
    end

    it 'should not be valid if password is different' do
      @user = User.new(
        name: 'name',
        email: 'example@email.com',
        password: 'password',
        password_confirmation: 'password1313'
      )
      expect(@user).to_not be_valid
    end

  end
end