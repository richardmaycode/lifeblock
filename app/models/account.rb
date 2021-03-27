class Account < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_one :mosaic_setting
  has_many :reflections, dependent: :destroy
end
