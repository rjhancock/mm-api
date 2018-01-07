require 'rails_helper'

RSpec.describe "servers/show", type: :view do
  before(:each) do
    @server = assign(:server, Server.create!(
      :port => 2,
      :ip_address => "Ip Address",
      :passworded => false,
      :users => "MyText",
      :server_key => "Server Key"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Ip Address/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Server Key/)
  end
end
