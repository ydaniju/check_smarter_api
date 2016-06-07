# frozen_string_literal: true
module Api
  module V1
    class AuthController < BaseController
      before_action :authenticate_request, only: [:logout]

      def login
        command = AuthenticateUser.call(params[:email], params[:password])

        if command.success?
          render json: command.result
        else
          render json: command.errors, status: :unauthorized
        end
      end

      def logout
        # current_user.update_attribute(:auth_token, nil) not yet implemented
        render json: { success: "You're succesfully logged out" }, status: 204
      end
    end
  end
end
