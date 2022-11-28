class PostsController < ApplicationController
  def show
    @posts = Post.all
    render template: "posts/show"
  end

  def create
    @posts = Post.new(
      title: params["title"],
      opening_id: params["opening_id"],
      common_position_id: params["common_position_id"],
      image: params["image"],
    )
  end
end
