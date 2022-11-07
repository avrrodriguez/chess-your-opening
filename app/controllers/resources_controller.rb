class ResourcesController < ApplicationController
  before_action :authenticate_admin

  def create
    resource = Resource.new(
      opening_id: params["opening_id"],
      link: params["link"],
      resource_type: params["resource_type"],
    )
    if resource.save
      render json: resource.as_json
    else
      render json: { "errors": resource.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    resource = Resource.find_by(id: params["id"])
    resource.opening_id = params["opening_id"] || resource.opening_id
    resource.link = params["link"] || resource.link
    resource.resource_type = params["resource_type"] || resource.resource_type

    if resource.save
      render json: resource.as_json
    else
      render json: { "errors": resource.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    resource = Resource.find_by(id: params["id"])
    resource.destroy
    render json: { "message": "resource is destroyed" }
  end
end
