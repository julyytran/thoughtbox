feature "user can log in and out" do
  scenario "on log in, they are directed to the links index" do
    user = User.create(email: "user@users.com", password: "password")

    visit root_path

    expect(page).to have_content "Log In or Sign Up"

    click_on "Log In"

    fill_in "Email", with: "user@users.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_on "Login"

    expect(page).to have_content "Links Index"
    expect(page).to have_content "Sign Out"
    expect(current_path).to eq root_path
  end

  scenario "on log out, they are directed to log in" do
    user = User.create(email: "user@users.com", password: "password")

    visit root_path

    expect(page).to have_content "Log In or Sign Up"

    click_on "Log In"

    fill_in "Email", with: "user@users.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_on "Login"

    expect(page).to have_content "Links Index"
    expect(page).to have_content "Sign Out"
    expect(current_path).to eq root_path

    click_on "Sign Out"

    expect(current_path).to eq login_path
    expect(page).to_not have_content "Links Index"
    expect(page).to_not have_content "Sign Out"
    expect(page).to have_content "Login"
  end
end
