require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'success to register WHEN name, email and password and password_confirmation are not blank' do
      expect(@user).to be_valid
    end

    it 'fail to register WHEN name is blank' do
      @user.name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank") 
    end

    it 'fail to register WHEN email is blank' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank") 
    end

    it 'fail to register WHEN password is blank' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank") 
    end

    it 'success to register WHEN password is more than 6 words' do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      expect(@user).to be_valid
    end

    it 'fail to register WHEN password is less than 5 words' do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)") 
    end

    it 'fail to register WHEN password is not equal password_confirmation' do
      @user.password = "123456"
      @user.password_confirmation = "654321"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password") 
    end

    it 'fail to register WHEN email is already used by another account' do
      @user.save
      user2 = FactoryBot.build(:user, email: @user.email)
      user2.valid?
      expect(user2.errors.full_messages).to include("Email has already been taken") 
    end
  end
end