class CommonPositionsController < ApplicationController
  before_action :authenticate_admin

  def create
    common_position = CommonPosition.new(
      description: params["description"],
      variation: params["variation"],
      opening_id: params["opening_id"],
      name: params["name"],
    )

    if common_position.save
      render json: common_position.as_json
    else
      render json: { "errors": common_position.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    common_position = CommonPosition.find_by(id: params["id"])
    common_position.description = params["description"] || common_position.description
    common_position.variation = params["variation"] || common_position.variation
    common_position.opening_id = params["opening_id"] || common_position.opening_id
    common_position.name = params["name"] || common_position.name

    if common_position.save
      render json: common_position.as_json
    else
      render json: { "errors": common_position.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    common_position = CommonPosition.find_by(id: params["id"])
    common_position.destroy
    render json: { "message": "destroyed" }
  end
end
