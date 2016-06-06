feature "user can view all links", :js => true do
  scenario "they see all the links" do
    create_links
    login_user
    wait_for_ajax

    expect(Link.count).to eq 3
    expect(page).to have_selector("li", count: 3)

    within("li:first-child") {
      expect(page).to have_content "Kewl Link"
      expect(page).to have_content "http://julyytran.github.io/game-time/"
      expect(page).to have_content "false"
    }

    within("li:nth-child(2)") {
      expect(page).to have_content "Awesome Link"
      expect(page).to have_content "http://julyytran.github.io/game-time/"
      expect(page).to have_content "false"
    }

    within("li:nth-child(3)") {
      expect(page).to have_content "Legit Link"
      expect(page).to have_content "http://julyytran.github.io/game-time/"
      expect(page).to have_content "false"
    }
  end
end
