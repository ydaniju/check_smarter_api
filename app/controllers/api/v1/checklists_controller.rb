# frozen_string_literal: true
module Api
  module V1
    class ChecklistsController < BaseController
      def index
        # this should later be replaced by current_user.checklists
        checklists = Checklist.all
        if checklists
          render json: checklists, status: 200
        else
          render json: { feedback: "You have no Checklist yet" }, status: 404
        end
      end

      def show
        if checklist
          render json: checklist, status: 200
        else
          render json: { errors: "This checklist does not exist" }, status: 404
        end
      end

      def create
        new_checklist = Checklist.new(checklist_params)
        if new_checklist.save
          render json: new_checklist, status: 201
        else
          render json: { errors: new_checklist.errors }, status: 422
        end
      end

      private

      def checklist_params
        params.permit(:title, :comments, :votes, :user_id)
      end

      def checklist
        Checklist.find_by(id: params[:id])
      end
    end
  end
end
