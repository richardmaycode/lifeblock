class ColorScheme < ApplicationRecord
  COLOR_OPTIONS = %i[default red blue green orange black].freeze

  has_many :mosaic_settings, dependent: :restrict_with_exception

  enum color: COLOR_OPTIONS
  
  validates :name, presence: true
  validates :color, presence: true, inclusion: { in: colors.keys }
end
