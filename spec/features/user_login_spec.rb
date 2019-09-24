require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  before :each do
    User.create!(
      first_name: "Anything",
      last_name: "Anything",
      email: "Anything@anything.com",
      password: "Anything",
      password_confirmation: "Anything"
    )
  end

  scenario "They see root page" do
    visit root_path

    find("a", text: "Login").click
    fill_in 'email', with: 'Anything@anything.com'
    fill_in 'password', with: 'Anything'
    click_button("Submit")
    save_screenshot
    expect(page.has_content? "Logout").to be true
  end

end
