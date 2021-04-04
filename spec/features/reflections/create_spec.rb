require "rails_helper"

RSpec.describe 'Creating a reflection', type: :feature do
  let!(:user) { create(:user) }
  let(:current_user) { user }

  scenario "valid inputs" do
    login_as user, scope: :user
    visit new_reflection_path(date: Time.zone.yesterday)
  end

  xscenario "invalid inputs" do
    
  end
end