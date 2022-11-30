class PostsController < ApplicationController
  before_action :set_post, only: %i[show update destroy]

  def index
    @posts = Post.all

    render template: "posts/index"
  end

  def show
    @posts = Post.all
    render template: "posts/show"
  end

  def create
    @post = Post.new(
      title: params["title"],
      opening_id: params["opening_id"],
      common_position_id: params["common_position_id"],
      image: params["image"],
    )
    p @post

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @post.title = params["title"] || @post.title
    @post.image = params["image"] || @post.image

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
