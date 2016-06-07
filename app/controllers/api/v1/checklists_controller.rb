# frozen_string_literal: true
module Api
  module V1
    class ChecklistsController < BaseController
      before_action :authenticate_request!, :checklist
      def index
        checklists = current_user.checklists
        render json: checklists, status: 200 if checklists
      end

      def show
        render json: { errors: "Checklist does not exist" },
               status: 404 unless @checklist
      end

      def create
        @checklist = Checklist.new(checklist_params)
        if @checklist.save
          render :show, status: 201
        else
          render json: { errors: @checklist.errors }, status: 422
        end
      end

      private

      def checklist_params
        params.permit(:title, :comments, :votes, :user_id)
      end

      def checklist
        @checklist = Checklist.find_by(id: params[:id])
      end
    end
  end
end
