require 'rails_helper'

RSpec.describe "servers/index", type: :view do
  before(:each) do
    assign(:servers, [
      Server.create!(
        :port => 2,
        :ip_address => "Ip Address",
        :passworded => false,
        :users => "MyText",
      ),
      Server.create!(
        :port => 2,
        :ip_address => "Ip Address",
        :passworded => false,
        :users => "MyText",
      )
    ])
  end

  it "renders a list of servers" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Ip Address".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
