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
        motd: "Looking for OpFOR"
      ),
      Server.create!(
        port: 2345,
        ip_address: "127.0.0.1",
        passworded: true,
        users: "MyText",
        version: '0.43-git',
        phase: 'Launch',
        motd: 'Blow shit up',
      )
    ])
  end

  it "renders a list of servers" do
    render
    assert_select "tr>td", text: "127.0.0.1:2345",    count: 2
    assert_select "tr>td", text: 'Looking for OpFOR', count: 1
    assert_select "tr>td", text: 'Blow shit up',      count: 1
    assert_select "tr>td", text: "MyText",            count: 2
    assert_select "tr>td", text: "0.43-git",          count: 2
    assert_select "tr>td", text: "Launch",            count: 2
  end
end
