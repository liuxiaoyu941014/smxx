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
RSpec.describe Agent::DeliveriesController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Delivery. As you add validations to Delivery, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for(:delivery)
  }
  let(:invalid_attributes) {
    attributes_for(:delivery)
  }
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Agent::DeliveriesController. Be sure to keep this updated too.

  login_admin
  # login_user
  # login_agent

  describe "GET #index" do
    it "returns a success response" do
      delivery = create(:delivery)
      get :index
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      delivery = create(:delivery)
      get :show, params: {id: delivery.to_param}
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_success
    end
  end
  describe "GET #edit" do
    it "returns a success response" do
      delivery = create(:delivery)
      get :edit, params: {id: delivery.to_param}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Delivery" do
        expect {
          post :create, params: {delivery: valid_attributes}
        }.to change(Delivery, :count).by(1)
      end

      it "redirects to the created agent_delivery" do
        post :create, params: {delivery: valid_attributes}
        expect(response).to redirect_to(agent_delivery_url(Delivery.last))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {delivery: invalid_attributes}
        expect(response).to be_success
      end
    end
  end
  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }
      it "updates the requested agent_delivery" do
        delivery = create(:delivery)
        put :update, params: {id: delivery.to_param, delivery: new_attributes}
        delivery.reload
        skip("Add assertions for updated state")
      end
      it "redirects to the agent_delivery" do
        delivery = create(:delivery)
        put :update, params: {id: delivery.to_param, delivery: valid_attributes}
        expect(response).to redirect_to(agent_delivery_url(delivery))
      end
    end
    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        delivery = create(:delivery)
        put :update, params: {id: delivery.to_param, delivery: invalid_attributes}
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested agent_delivery" do
      delivery = create(:delivery)
      expect {
        delete :destroy, params: {id: delivery.to_param}
      }.to change(Delivery, :count).by(-1)
    end
    it "redirects to the agent_deliveries list" do
      delivery = create(:delivery)
      delete :destroy, params: {id: delivery.to_param}
      expect(response).to redirect_to(agent_deliveries_url)
    end
  end
end
