require 'rails_helper'

RSpec.describe "servers/index", type: :view do
  before(:each) do
    assign(:servers, [
      Server.create!(
        :port => 2345,
        :ip_address => "127.0.0.1",
        :passworded => false,
        :users => "MyText",
      ),
      Server.create!(
        :port => 2345,
        :ip_address => "127.0.0.1",
        :passworded => false,
        :users => "MyText",
      )
    ])
  end

  it "renders a list of servers" do
    render
    assert_select "tr>td", :text => 2345.to_s, :count => 2
    assert_select "tr>td", :text => "127.0.0.1".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
