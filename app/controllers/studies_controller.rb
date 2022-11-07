class StudiesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    studies = Study.all.order(:id)
    render json: studies.as_json
  end

  def show
    study = Study.find_by(id: params["id"])

    render json: study.as_json
  end

  def create
    study = Study.new(
      user_id: params["user_id"],
      opening_id: params["opening_id"],
      notes: params["notes"],
      public: params["public"],
    )
    if study.save
      render json: study.as_json
    else
      render json: { "errors": study.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    study = Study.find_by(id: params["id"])
    study.user_id = params["user_id"] || study.user_id
    study.opening_id = params["opening_id"] || study.opening_id
    study.notes = params["notes"] || study.notes
    study.public = params["public"] || study.public

    if study.save
      render json: study.as_json
    else
      render json: { "errors": study.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    study = Study.find_by(id: params["id"])
    study.destroy
    render json: { "message": "destroyed successfully" }
  end
end
