class UsersController < ApplicationController
  def create
    user = User.new(
      email: params["email"],
      password: params["password"],
    )
    if user.save
      render json: user.as_json
    else
      render json: { "errors": user.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
