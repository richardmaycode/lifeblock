require 'rails_helper'

RSpec.describe "MosaicSettings", type: :request do
  describe "GET /edit" do
    it "returns http success" do
      get "/mosaic_settings/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
