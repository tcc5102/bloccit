class FavoriteMailer < ApplicationMailer
  default from: 'tyler.cooper91@gmail.com'

  def new_comment(user, post, comment)

    headers["Message-ID"] = "<comments/#{comment.id}@peaceful-waters-66074.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@peaceful-waters-66074.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@peaceful-waters-66074.herokuapp.com>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end

  def new_post(post)

    headers["Message-ID"] = "<posts/#{post.id}@peaceful-waters-66074.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@peaceful-waters-66074.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@peaceful-waters-66074.herokuapp.com>"

    @post = post

    mail(to: post.user.email, subject: "You're following, #{post.title}")
  end
end
