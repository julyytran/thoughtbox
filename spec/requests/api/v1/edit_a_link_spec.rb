RSpec.describe "PATCH links index" do
  it "edits a link" do
    create_links
    link = Link.first
    link_params = {title: "New Link", url: "http://julyytran.github.io/game-time/"}

    patch "/api/v1/links/#{link.id}", link: link_params

    expect(response.status).to eq 200
    expect(Link.first.title).to eq "New Link"
  end
end
