require 'rails_helper'

RSpec.describe "servers/new", type: :view do
  before(:each) do
    assign(:server, Server.new(
      :port => 1,
      :ip_address => "MyString",
      :passworded => false,
      :users => "MyText",
      :server_key => "MyString"
    ))
  end

  it "renders new server form" do
    render

    assert_select "form[action=?][method=?]", servers_path, "post" do

      assert_select "input[name=?]", "server[port]"

      assert_select "input[name=?]", "server[ip_address]"

      assert_select "input[name=?]", "server[passworded]"

      assert_select "textarea[name=?]", "server[users]"

      assert_select "input[name=?]", "server[server_key]"
    end
  end
end
