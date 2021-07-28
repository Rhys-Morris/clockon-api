require 'rails_helper'

RSpec.describe "WorkPeriods", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/work_periods/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/work_periods/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/work_periods/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/work_periods/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
