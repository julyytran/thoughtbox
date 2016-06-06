require 'rails_helper'

RSpec.describe Link, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :url }
  it { should validate_presence_of :read }

it "has default quality of swill" do
  link = Link.create(title: "Good link", url: "julyytran.github.io/game-time/")

  expect(link.read).to eq false
end

end
