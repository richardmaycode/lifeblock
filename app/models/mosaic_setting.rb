class MosaicSetting < ApplicationRecord
  belongs_to :color_scheme
  belongs_to :account

  validates :show_numbers, inclusion: { in: [ true, false ] }
  validates :show_labels, inclusion: { in: [ true, false ] }
  validates :show_upcoming_dates, inclusion: { in: [ true, false ] }
  validates :show_skipped_days, inclusion: { in: [ true, false ] }

end
