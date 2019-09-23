require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    subject { described_class.new(
      name: "Anything",
      price_cents: 0,
      quantity: 0,
      category: nil
    ) }

    it "is valid with valid attributes" do
      @category = Category.new(name: "Book")
      subject.category = @category
      expect(subject).to be_valid
    end
    it "is not valid without a name" do
      @category = Category.new(name: "Book")
      subject.category = @category
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a price_cents" do
      @category = Category.new(name: "Book")
      subject.category = @category
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a quantity" do
      @category = Category.new(name: "Book")
      subject.category = @category
      subject.quantity = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a category" do
      expect(subject).to_not be_valid
    end
  end
end
