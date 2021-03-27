class ReflectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_reflection, only: %i[edit update]
  def index
    @date = params.fetch(:date, Date.today).to_date

    @reflections = @current_user.reflections.where(completed: @date.beginning_of_month..@date.end_of_month)
  end

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

  def reflection_params
    params.require(:reflection).permit(:completed, :mood, :note, :account_id, :creator_id)
  end
end
