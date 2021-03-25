require 'rails_helper'

RSpec.describe "Reflections", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/reflections/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/reflections/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
