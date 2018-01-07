require 'rails_helper'

RSpec.describe "servers/edit", type: :view do
  before(:each) do
    @server = assign(:server, Server.create!(
      :port => 1,
      :ip_address => "MyString",
      :passworded => false,
      :users => "MyText",
      :server_key => "MyString"
    ))
  end

  it "renders the edit server form" do
    render

    assert_select "form[action=?][method=?]", server_path(@server), "post" do

      assert_select "input[name=?]", "server[port]"

      assert_select "input[name=?]", "server[ip_address]"

      assert_select "input[name=?]", "server[passworded]"

      assert_select "textarea[name=?]", "server[users]"

      assert_select "input[name=?]", "server[server_key]"
    end
  end
end
