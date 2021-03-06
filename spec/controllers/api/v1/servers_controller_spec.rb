require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe Api::V1::ServersController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Server. As you add validations to Server, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      port: 2346,
      passworded: false,
      users: 'hammer,scjazz,wild79',
      ip_address: '127.0.0.1',
      version: '0.43-git',
      phase: 'Idle',
    }
  }

  let(:invalid_attributes) {
    {
      port: '1F3',
      users: true,
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ServersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Server.create! valid_attributes
      get :index, params: {}, session: valid_session, format: :json
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Server" do
        expect {
          post :create, params: { server: valid_attributes }, session: valid_session
        }.to change(Server, :count).by(1)
      end

      it "redirects to the created server" do
        post :create, params: { server: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { server: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          users: 'hammer,sckjazz'
        }
      }

      it "updates the requested server" do
        server = Server.create! valid_attributes
        put :update, params: {id: server.server_key, server: new_attributes}, session: valid_session
        server.reload
        expect(response).to have_http_status(:accepted)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        server = Server.create! valid_attributes
        put :update, params: { id: server.server_key, server: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested server" do
      server = Server.create! valid_attributes
      expect {
        delete :destroy, params: { id: server.server_key }, session: valid_session
      }.to change(Server, :count).by(-1)
    end

    it "redirects to the servers list" do
      server = Server.create! valid_attributes
      delete :destroy, params: { id: server.server_key }, session: valid_session
      expect(response).to have_http_status(:ok)
    end
  end

end
