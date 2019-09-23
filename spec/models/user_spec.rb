require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validation" do
    subject { described_class.new(
      first_name: "Anything",
      last_name: "Anything",
      email: "Anything@email.com",
      password: "Anything",
      password_confirmation: "Anything"
    )}
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "must be created with password and password confirmation fields" do  
      subject.password_confirmation = nil
      expect(subject).to_not be_valid 
    end
    it "must have a unique email" do
      @invalid_user = User.create(
        first_name: "Anything2",
        last_name: "Anything2",
        email: "AnythinG@email.com",
        password: "Anything2",
        password_confirmation: "Anything2"
      )
      expect(subject).to_not be_valid
    end
    it "must contain an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    it "must contain an first_name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end
    it "must contain an last_name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end
    it "must have a password greater than or equal to 5" do
      subject.password = "5etw"
      expect(subject).to_not be_valid
    end

  end
end
