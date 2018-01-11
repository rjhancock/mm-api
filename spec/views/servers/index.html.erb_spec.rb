require 'rails_helper'

RSpec.describe "servers/index", type: :view do
  before(:each) do
    assign(:servers, [
      Server.create!(
        port: 2345,
        ip_address: "127.0.0.1",
        passworded: false,
        users: "MyText",
        version: '0.43-git',
        phase: 'Launch',
      ),
      Server.create!(
        :port => 2345,
        :ip_address => "127.0.0.1",
        :passworded => false,
        :users => "MyText",
        version: '0.43-git',
        phase: 'Launch',
      )
    ])
  end

  it "renders a list of servers" do
    render
    assert_select "tr>td", :text => "127.0.0.1:2345".to_s, :count => 2
    assert_select "tr>td", :text => 'No', :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "0.43-git".to_s, :count => 2
    assert_select "tr>td", :text => "Launch".to_s, :count => 2
  end
end
