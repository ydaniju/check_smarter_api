# frozen_string_literal: true
module Api
  module V1
    class UsersController < BaseController
      before_action :user

      def show
        render json: { error: "User not found" }, status: 404 unless @user
      end

      def create
        @user = User.new user_params
        if @user.save
          render :show, status: 201
        else
          render json: { errors: @user.errors }, status: 422
        end
      end

      def update
        if user.update user_params
          render :show, status: 200
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
        params.permit(
          :firstname,
          :lastname,
          :email,
          :password,
          :password_confirmation
        )
      end

      def user
        @user = User.find_by(id: params[:id])
      end
    end
  end
end
