require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do      
      @user = User.new(name: "Jay", email: "chunsaa@gmail.com", password: "123", password_confirmation: "123")
    end

    it "is valid with all fields" do
      expect(@user).to be_valid
    end

    it "is not valid with wrong password confirmation" do
      @user.password_confirmation = "hello"
      expect(@user).to_not be_valid
    end

    it "is not valid with no name" do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it "is not valid with no email" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "is not valid with password shorter than 3 characters" do
      @user.password = "yo"
      @user.password_confirmation = "yo"
      expect(@user).to_not be_valid
    end
  
    it "is not valid to signup with same email" do
      @user.save
      @user1 = User.new(name: "Tim", email: "chunsaa@gmail.com", password: "123", password_confirmation: "123")
      @user1.save
      expect(@user1.errors.messages[:email][0]).to eq("has already been taken")
    end

    it "is not valid to signup with same email (case-sensitivity)" do
      @user.save
      @user1 = User.new(name: "Tim", email: "ChUnSAA@GMAIL.com", password: "123", password_confirmation: "123")
      @user1.save
      expect(@user1.errors.messages[:email][0]).to eq("has already been taken")
    end
  end

  describe '.authenticate_with_credentials' do
    before(:each) do      
      @user = User.create(name: "Jay", email: "chunsaa@gmail.com", password: "123", password_confirmation: "123")
    end

    it "is valid with correct login info" do      
      @email = "chunsaa@gmail.com"
      @password = "123"
      @return_val = User.authenticate_with_credentials(@email, @password)
      expect(@user).to eq(@return_val)
    end

    it "is valid with regardless of spaces in front and end" do     
      @email = "  chunsaa@gmail.com  "
      @password = "123"
      @return_val = User.authenticate_with_credentials(@email, @password)
      expect(@user).to eq(@return_val)
    end

    it "is valid with regardless of case sensitivity" do      
      @email = "cHunSAA@GMAIL.com"
      @password = "123"
      @return_val = User.authenticate_with_credentials(@email, @password)
      expect(@user).to eq(@return_val)
    end

    it "is not valid with wrong email" do      
      @email = "yolo@gmail.com"
      @password = "123"
      @return_val = User.authenticate_with_credentials(@email, @password)
      expect(@user).to_not eq(nil)
    end

    it "is not valid with wrong password" do      
      @email = "chunsaa@gmail.com"
      @password = "1234"
      @return_val = User.authenticate_with_credentials(@email, @password)
      expect(@user).to_not eq(nil)
    end
  end
end
