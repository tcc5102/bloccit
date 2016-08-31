require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do

  let(:sponsored_post) { SponsoredPost.create!(title: "New Post Title", body: "New Post Body", price: 99) }
  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }
  let(:price) { 99 }
  let(:topic) { Topic.create!(name: name, description: description) }
  let(:sponsored_post) { topic.sponsored_posts.create!(title: title, body: body, price: 99) }

  it { is_expected.to belong_to(:topic) }

  describe "attributes" do
    it "has a title, body, and price attributes" do
      expect(sponsored_post).to have_attributes(title: title, body: body, price: 99)
    end
  end
end
