feature "user can search links", :js => true do
  scenario "they see links containing search query" do
    create_links
    login_user
    wait_for_ajax

    expect(page).to have_selector("li", count: 3)

    fill_in 'search-box', :with => 'legit'

    wait_for_ajax

    expect(page).to have_selector("li", count: 1)
    expect(page).to have_content "Legit Link"
    expect(page).to_not have_content "Kewl Link"
    expect(page).to_not have_content "Awesome Link"
  end
end
