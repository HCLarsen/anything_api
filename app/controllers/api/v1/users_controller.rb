module Api::V1
  class UsersController < ApplicationController
    include DeviseTokenAuth::Concerns::SetUserByToken
    before_action :authenticate_api_v1_user!

    def index
      render json: {
        data: [{
          message: "Welcome #{current_user.email}",
          user: current_user
        }]
      }, status: 200
    end

    def show
      render json: {
        data: {
          message: "Welcome #{current_api_v1_user.email}",
          user: current_api_v1_user
        }
      }, status: 200
    end
  end
end
