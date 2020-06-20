require 'rails_helper'

RSpec.describe "Api::BigQueries", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/api/big_queries/index"
      expect(response).to have_http_status(:success)
    end
  end

end
