class PostsController < ApplicationController
  def show
    @posts = Post.all
    render template: "posts/show"
  end
end
