module UsersHelper
  def user_has_posts_or_comments
    current_user? && current_user.posts?
  end
end
