# frozen_string_literal: true
module Api
  module V1
    class UsersController < BaseController
      def create
        new_user = User.new(user_params)
        if user.save
          render json: new_user, status: 201
        else
          render json: { errors: new_user.errors }, status: 422
        end
      end

      def update
        if user.update(user_params)
          render json: user, status: 200
        else
          render json: { errors: user.errors }, status: 422
        end
      end

      private

      def user_params
        params.permit(:firstname, :lastname, :email)
      end

      def user
        User.find_by(id: params[:id])
      end
    end
  end
end
