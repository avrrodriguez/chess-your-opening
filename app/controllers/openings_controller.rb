class OpeningsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @openings = Opening.all.order(:id)

    render template: "openings/index"
  end

  def show
    @opening = Opening.find_by(id: params["id"])

    render template: "openings/show"
  end

  def create
    @opening = Opening.new(
      name: params["name"],
      image_url: params["image_url"],
      description: params["description"],
      difficulty: params["difficulty"],
      variation: params["variation"],
    )

    if @opening.save
      render template: "openings/show"
    else
      render json: { "errors": @opening.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @opening = Opening.find_by(id: params["id"])
    @opening.name = params["name"] || @opening.name
    @opening.image_url = params["image_url"] || @opening.image_url
    @opening.description = params["description"] || @opening.description
    @opening.difficulty = params["difficulty"] || @opening.difficulty
    @opening.variation = params["variation"] || @opening.variation

    if @opening.save
      render json: @opening.as_json
    else
      render json: { "errors": @opening.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @opening = Opening.find_by(id: params["id"])
    @opening.destroy

    render json: { "message": "d.. d.. destroyed" }
  end
end
