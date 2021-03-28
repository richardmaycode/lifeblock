module Mosaic
  class StatisticsController < ApplicationController
    before_action :set_user, :set_date_and_range
    def show
      @date = params.fetch(:date, Date.today).to_date

      @reflections = @current_user.reflections.where(completed: @date_range)
    end

    private

    def set_user
      @current_user = current_user
    end

    def set_date_and_range
      if params[:start_date].present?
        @date = params[:start_date].to_date
        @date_range = params[:start_date].to_date..params[:end_date].to_date
      else
        @date = params.fetch(:date, Date.today).to_date
        @date_range = @date.beginning_of_month..@date.end_of_month
      end
    end
  end
end