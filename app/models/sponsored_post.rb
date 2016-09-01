class SponsoredPost < ActiveRecord::Base
  belongs_to :topic
  def comments
    Comment.none
  end
end
