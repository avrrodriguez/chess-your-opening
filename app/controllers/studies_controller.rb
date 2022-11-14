class StudiesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    if current_user
      @studies = Study.where(public: true).or(Study.where(user_id: current_user.id)).order(:id)
    else
      @studies = Study.where(public: true)
    end

    render template: "studies/index"
  end

  def show
    @study = Study.find_by(id: params["id"])

    render template: "studies/show"
  end

  def create
    @study = Study.new(
      user_id: current_user.id,
      opening_id: params["opening_id"],
      notes: params["notes"],
      public: params["public"],
    )
    if @study.save
      render template: "studies/show"
    else
      render json: { "errors": @study.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @study = Study.find_by(id: params["id"])
    @study.opening_id = params["opening_id"] || @study.opening_id
    @study.notes = params["notes"] || @study.notes
    @study.public = params["public"] || @study.public

    if @study.save
      render template: "studies/show"
    else
      render json: { "errors": @study.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @study = Study.find_by(id: params["id"])
    @study.destroy
    render json: { "message": "destroyed successfully" }
  end
end
