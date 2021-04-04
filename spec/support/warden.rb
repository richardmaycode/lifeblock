include Warden::Test::Helpers
RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers, type: :feature
end