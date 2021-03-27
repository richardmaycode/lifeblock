class MosaicSettingsController < ApplicationController
  before_action :set_mosaic_setting
  def edit; end

  def update
    respond_to do |format|
      if @mosaic_setting.update(mosiac_setting_params)
        format.html { redirect_to reflections_path, notice: "Mosiac settings updated!" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_mosaic_setting
    @mosaic_setting = MosaicSetting.find(params[:id])
  end

  def mosaic_setting_params
    params.require(:mosaic_setting).permit(:color_scheme_id, :show_numbers, :show_labels, :show_upcoming_dates, :show_skipped_days)
  end
end
