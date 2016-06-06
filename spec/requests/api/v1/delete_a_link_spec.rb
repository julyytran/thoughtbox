RSpec.describe "DELETE links index" do
  it "deletes the link" do
    create_links
    link = Link.last
    count = Link.count

    delete "/api/v1/links/#{link.id}"

    expect(response.status).to eq 200
    expect(Link.count).to eq (count - 1)
  end
end
