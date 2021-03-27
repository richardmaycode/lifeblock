class Account < ApplicationRecord
  ACCOUNT_ROLES = %i[admin user].freeze
  belongs_to :owner, class_name: "User"
  has_one :mosaic_setting
  has_many :reflections, dependent: :destroy

  enum role: ACCOUNT_ROLES
end
