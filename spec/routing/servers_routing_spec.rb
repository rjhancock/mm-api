require "rails_helper"

RSpec.describe ServersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/servers").to route_to("servers#index")
    end
  end
end
