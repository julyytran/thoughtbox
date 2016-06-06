feature "Visitor can register" do
  scenario "they are directed to their dashboard" do
    visit root_path

    expect(page).to have_content "Please sign up"

    fill_in "Email", with: "user@users.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_on "Create Account"

    expect(page).to have_content "links"
    expect(page).to have_content "logout"
  end

  # scenario "passwords do not match" do
  #   visit root_path
  #
  #   expect(page).to have_content "Please sign up"
  #
  #   fill_in "Email", with: "user1@users.com"
  #   fill_in "Password", with: "password"
  #   fill_in "Password confirmation", with: "afdfiadfkjl"
  #
  #   click_on "Create Account"
  #
  #   expect(page).to_not have_content "Hello, user1@users.com"
  #   expect(page).to have_content "Please sign up"
  # end

  # scenario "email is already registered" do
  #
  # end
end
