require 'rails_helper'


RSpec.describe User, type: :model do
  
  describe 'Validations' do
    it "should not save with empty first name" do
      @user = User.new(first_name: "", last_name: "Doe", email: "JohnDoe@gmail.com", password: "johndoe", password_confirmation: "johndoe")
      @user.save
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "should not save with empty last name" do
      @user = User.new(first_name: "John", last_name: "", email: "JohnDoe@gmail.com", password: "johndoe", password_confirmation: "johndoe")
      @user.save
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "should not save with empty email" do
      @user = User.new(first_name: "John", last_name: "Doe", email: "", password: "johndoe", password_confirmation: "johndoe")
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "should not save with empty password" do
      @user = User.new(first_name: "John", last_name: "Doe", email: "JohnDoe@gmail.com", password: "", password_confirmation: "johndoe")
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "should not save with empty password confirmation" do
      @user = User.new(first_name: "John", last_name: "Doe", email: "JohnDoe@gmail.com", password: "johndoe", password_confirmation: "")
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "should not save with non unique email" do
      @user1 = User.new(first_name: "John", last_name: "Doe", email: "JohnDoe@gmail.com", password: "johndoe", password_confirmation: "johndoe")
      @user2 = User.new(first_name: "John", last_name: "Doe", email: "JohnDoe@gmail.com", password: "johndoe", password_confirmation: "johndoe")
      @user1.save
      @user2.save
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end  

    it "should not save if password has less than 4 characters" do
      @user = User.new(first_name: "John", last_name: "Doe", email: "JohnDoe@gmail.com", password: "doe", password_confirmation: "doe")
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 4 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    before(:each) do
      @email = "JohnDoe@gmail.com"
      @password = "Doe1"
      user = User.create(first_name:"John", last_name: "Doe", email: @email, password: @password, password_confirmation: @password)
    end

    describe 'spec(:each)' do
      it 'should allow users to submit email with spaces on either end' do
        user = User.authenticate_with_credentials(" JohnDoe@gmail.com ", @password)
        expect(user).to be_a(User)
      end

      it 'should allow users to login incorrect case in email' do
        user = User.authenticate_with_credentials("jOHndOe@gMAIl.coM", @password)
        expect(user).to be_a(User)
      end
    end
  end

end
