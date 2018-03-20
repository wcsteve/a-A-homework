require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    FactoryBot.build(:user,
      email: "jonathan@fakesite.com",
      password: "good_password")
  end

  describe "Users Model" do
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:password_digest) }
    it  do
      should validate_length_of(:password).
        is_at_least(6).
        on(:create)
    end
  end

  describe "#is_password?" do
    it "should return true for correct credentials" do
      expect(user.is_password?('good_password')).to be true
    end

    it "should return false for incorrect password" do
      expect(user.is_password?('wrong_input')). to be false
    end
  end


  describe "#reset_session_token" do
    it 'sets a new session token' do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).not_to eql(old_session_token)
    end
  end

  describe '::find_by_credentials' do
    before { user.save! }

    it 'correctly finds the user by looking up username' do
      expect(User.find_by_credentials('jonathan@fakesite.com', 'good_password')).to eq(user)
    end
  end

end
