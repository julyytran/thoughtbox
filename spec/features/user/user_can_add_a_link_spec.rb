feature "user can add a link", :js => true do
  scenario "they see their new link added to the list " do
    create_links
    login_user
    wait_for_ajax

    fill_in 'title', :with => 'NEW LINK!'
    fill_in 'url', :with => 'http://julyytran.github.io/game-time/'
    click_on 'Save!'

    wait_for_ajax

    within("li:first-child") {
      expect(page).to have_content 'NEW LINK!'
      expect(page).to have_content 'http://julyytran.github.io/game-time/'
      expect(page).to have_content 'false'
    }
  end
end
