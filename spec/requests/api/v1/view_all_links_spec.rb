RSpec.describe "GET links index" do
  it "returns a list of all links" do
    create_links

    get "/api/v1/links"

    expect(response.status).to eq 200
    json_body = JSON.parse(response.body)
    expect(json_body.count).to eq(3)

    link = json_body[0]

    expect(link).to eq ({
      "id" => link["id"],
      "title" => "Kewl Link",
      "url" => "http://julyytran.github.io/game-time/",
      "read" => "false",
      "created_at"=> link["created_at"],
      "updated_at"=> link["updated_at"]
      })
  end
end
