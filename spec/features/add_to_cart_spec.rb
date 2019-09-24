require 'rails_helper'

RSpec.feature "Add to Cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
    end
  end

  scenario "They see all products" do
    # ACT
    visit root_path
    expect(page.has_content? "My Cart (0)").to be true

    # VERIFY
    first('.actions .btn').click
    sleep 2
    save_screenshot
    expect(page.has_content? "My Cart (1)").to be true
  end
end
