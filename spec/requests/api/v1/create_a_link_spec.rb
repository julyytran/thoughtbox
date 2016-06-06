RSpec.describe "POST links index" do
  it "creates a link" do
    link_params = {title: "New Link", url: "http://julyytran.github.io/game-time/"}

    post "/api/v1/links", link: link_params

    expect(response.status).to eq 200
    expect(Link.last.title).to eq "New Link"
  end
end
