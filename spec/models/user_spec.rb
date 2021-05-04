require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

      it "should validate when user has all required fields completed" do
        @user = User.new(
          first_name: "Mathieu",
          last_name: "Rousseau",
          email: "mrousseau@lhlabs.com", 
          password: "password123", 
          password_confirmation: "password123")
        expect(@user).to be_valid
      end

      it "should not be valid when the password and password confirmation do not match" do
        @user = User.new(
          first_name: "Mathieu",
          last_name: "Rousseau",
          email: "mrousseau@lhlabs.com", 
          password: "password123", 
          password_confirmation: "hacker_man")
        expect(@user).to_not be_valid
      end

      it "should not be valid without an email" do
      @user = User.new(
        first_name: "Mathieu",
        last_name: "Rousseau", 
        password: "password123", 
        password_confirmation: "hacker_man")
      expect(@user).to_not be_valid
      end

      it "should not be valid without a password & password confirmation" do
        @user = User.new(
          first_name: "Mathieu",
          last_name: "Rousseau", 
          email: "mrousseau@lhlabs.com")
        expect(@user).to_not be_valid
      end

      it "should not be valid without a name" do
        @user = User.new(
          email: "mrousseau@lhlabs.com", 
          password: "password123", 
          password_confirmation: "password123")
        expect(@user).to_not be_valid
      end

      it "should not be valid if the password is not at least 8 characters" do
        @user = User.new(
          first_name: "Mathieu",
          last_name: "Rousseau",
          email: "mrousseau@lhlabs.com", 
          password: "1234567", 
          password_confirmation: "1234567")
        expect(@user).to_not be_valid
      end

      it "should not validate if email already exists" do
        @user_a = User.new(
          first_name: "Mathieu",
          last_name: "Rousseau", 
          email: "mrousseau@lhlabs.com", 
          password: "password123", 
          password_confirmation: "password123")
        @user_a.save
        @user_b = User.new(
          first_name: "Mathieu",
          last_name: "Rousseau",
          email: "mrousseau@lhlabs.com", 
          password: "password123", 
          password_confirmation: "password123")
        expect(@user_b).to_not be_valid
      end
    end

    describe '.authenticate_with_credentials' do
      it "A user should successfuly authenticate with the correct credentials" do
        @user = User.new(
          first_name: "Mathieu",
          last_name: "Rousseau",
          email: "mrousseau@lhlabs.com", 
          password: "password123", 
          password_confirmation: "password123")
        @user.save
        user = User.authenticate_with_credentials("mrousseau@lhlabs.com", "password123")
        expect(user).to eq(@user)
      end

      it "A user should not successfuly authenticate with incorrect credentials" do
        @user = User.new(
          first_name: "Mathieu",
          last_name: "Rousseau",
          email: "mrousseau@lhlabs.com", 
          password: "password123", 
          password_confirmation: "password123")
        @user.save
        user = User.authenticate_with_credentials("mrousseau@lhlabs.com", "hacker_man")
        expect(user).to_not eq(@user)
      end

    end
  end
