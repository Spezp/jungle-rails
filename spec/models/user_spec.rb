require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    describe "register" do

      test_user = User.new(
        email: "unique2@asdf.com",
        password: "asdfasdf",
        password_confirmation: "asdfasdf")
      test_user.save
      it("is valid") do
        expect(test_user).to be_valid
      end
      test_user.destroy
    end

    describe "when email" do
      test_user_fail = User.new(
        password: "asdfasdf",
        password_confirmation: "asdfasdf")
      test_user_fail.save

      it "is missing" do
        expect(test_user_fail).to_not be_valid
      end
    end

    describe "when password" do
      test_user_fail = User.new(
        email: "asdfasdf@asdf1.com",
        password_confirmation: "asdfasdf")
      test_user_fail.save

      it "is missing" do
        expect(test_user_fail).to_not be_valid
      end
    end

    describe "when password" do
      test_user_fail = User.new(
        email: "asdfasdf@asdf3.com",
        password_confirmation: "as")
      test_user_fail.save

      it "is less than three characters" do
        expect(test_user_fail).to_not be_valid
      end
    end

    describe "when password confirmation" do
      test_user_fail = User.new(
        email: "asdfasdf@asdf2.com",
        password: "asdfasdf")
      test_user_fail.save

      it "is missing" do
        expect(test_user_fail).to_not be_valid
      end
    end

    describe "when email & different case" do
      test_user_fail = User.new(
        email: "unique@asdf.com",
        password: "asdfasdf",
        password_confirmation: "asdfasdf")
      test_user_fail.save
      test_user_duplicate = User.new(
        email: "unique@asdf.com",
        password: "asdfasdf",
        password_confirmation: "asdfasdf")
      test_user_duplicate.save

      it "is duplicate" do
        expect(test_user_duplicate.errors.full_messages).to include("Email has already been taken")
      end
      puts "asdf"
      # test_user_fail.destroy
      # test_user_duplicate.destroy
    end
  end

  describe '.authenticate_with_credentials' do

    before(:each) do
      @user = User.new(
      email: "thistest@asdf.com",
      password: "asdfasdf",
      password_confirmation: "asdfasdf")
      @user.save!
    end

    after(:each) do
      @user.destroy
    end

    it "is user" do
      test_user_auth = User.authenticate_with_credentials(@user.email, @user.password)
      expect(test_user_auth).to eq(@user)
    end

  end

end
