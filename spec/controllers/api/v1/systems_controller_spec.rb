require 'rails_helper'

RSpec.describe Api::V1::SystemsController, type: :controller do

  before :each do
    request.env["HTTP_ACCEPT"] = 'application/json'
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
