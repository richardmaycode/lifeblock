class ReflectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_reflection, only: %i[show edit update]
  before_action :set_date_and_range, only: %i[index]
  def index
    # @date = params.fetch(:date, Date.today).to_date

    @reflections = @current_user.reflections.where(completed: @date_range)
  end

  def show; end

  def new
    date = params.fetch(:date, Date.today)
    @reflection = Reflection.new(completed: date)
  end

  def create
    @reflection = Reflection.new(reflection_params)

    respond_to do |format|
      if @reflection.save
        format.html { redirect_to reflections_path(date: @reflection.completed), notice: "Successfully created" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    authorize @reflection
  end

  def update
    respond_to do |format|
      if @reflection.update(reflection_params)
        format.html { redirect_to reflections_path(date: @reflection.completed), notice: "Successfully updated" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @current_user = current_user
  end

  def set_reflection
    @reflection = Reflection.find(params[:id])
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
  def reflection_params
    params.require(:reflection).permit(:completed, :mood, :note, :account_id, :creator_id)
  end
end
