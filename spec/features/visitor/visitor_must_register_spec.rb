feature "Visitor can register" do
  scenario "they are directed to the links index" do
    visit root_path

    expect(page).to have_content "Log In or Sign Up"

    click_on "Sign Up"

    fill_in "Email", with: "user@users.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_on "Create Account"

    expect(page).to have_content "Links Index"
    expect(page).to have_content "Sign Out"
    expect(current_path).to eq root_path
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
