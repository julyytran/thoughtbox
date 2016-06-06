feature "user can change read staus", :js => true do
  scenario "they mark read" do
    create_links
    login_user
    wait_for_ajax

    within("li:first-child") {
      click_on "Mark as read!"
    }

    wait_for_ajax

    within("li:first-child") {
      expect(page).to have_content "true"
      expect(page).to_not have_content "false"
    }

  end

  scenario "they mark unread" do
    create_links
    login_user
    wait_for_ajax

    within("li:first-child") {
      click_on "Mark as read!"
    }

    wait_for_ajax

    within("li:first-child") {
      expect(page).to have_content "true"
      expect(page).to_not have_content "false"
    }

    within("li:first-child") {
      click_on "Mark as unread!"
    }

    within("li:first-child") {
      expect(page).to have_content "false"
      expect(page).to_not have_content "true"
    }
  end
end
