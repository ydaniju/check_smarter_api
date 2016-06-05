# frozen_string_literal: true
module Api
  module V1
    class UsersController < BaseController
      def show
        if user
          render json: user, status: 200
        else
          render json: { error: "This user does not exist" }, status: 404
        end
      end

      def create
        new_user = User.new(user_params)
        if new_user.save
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

      def destroy
        user.destroy
        head 204
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
