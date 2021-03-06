module Helpers
  def create_links
    Link.create(title: "Kewl Link", url: "http://julyytran.github.io/game-time/")
    Link.create(title: "Awesome Link", url: "http://julyytran.github.io/game-time/")
    Link.create(title: "Legit Link", url: "http://julyytran.github.io/game-time/")
  end

  def login_user
    user = User.create(email: "user@users.com", password: "password")

    visit root_path

    expect(page).to have_content "Log In or Sign Up"

    click_on "Log In"

    fill_in "Email", with: "user@users.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_on "Login"
  end
end

module WaitForAjax
  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
