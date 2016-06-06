feature "user can edit a link", :js => true do
  scenario "they edit the title" do
    Link.create(title: "Kewl Link", url: "http://julyytran.github.io/game-time/")
    login_user
    wait_for_ajax

    find(".title").click
    find(".title").native.send_keys('zzz')
    find(".title").native.send_keys(:return)

    wait_for_ajax

    within("li:first-child") {
      expect(page).to have_content 'Kewl Linkzzz'
      expect(page).to have_content 'http://julyytran.github.io/game-time/'
      expect(page).to have_content 'false'
    }
  end

  scenario "they edit the url" do
    Link.create(title: "Kewl Link", url: "http://julyytran.github.io/game-time/")
    login_user
    wait_for_ajax

    find(".url").click
    find(".url").native.send_keys('so-fun')
    find(".url").click
    find(".url").native.send_keys('so-fun')
    find(".url").native.send_keys(:return)

    wait_for_ajax

    within("li:first-child") {
      expect(page).to have_content 'Kewl Link'
      expect(page).to have_content 'http://julyytran.github.io/game-time/so-fun'
      expect(page).to have_content 'false'
    }
  end
end
