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
RSpec.describe Admin::MaterialManagementHistoriesController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Admin::MaterialManagementHistory. As you add validations to Admin::MaterialManagementHistory, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for(:admin_material_management_history)
  }
  let(:invalid_attributes) {
    attributes_for(:admin_material_management_history)
  }
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Admin::MaterialManagementHistoriesController. Be sure to keep this updated too.

  login_admin
  # login_user
  # login_agent

  describe "GET #index" do
    it "returns a success response" do
      admin_material_management_history = create(:admin_material_management_history)
      get :index
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      admin_material_management_history = create(:admin_material_management_history)
      get :show, params: {id: admin_material_management_history.to_param}
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
      admin_material_management_history = create(:admin_material_management_history)
      get :edit, params: {id: admin_material_management_history.to_param}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Admin::MaterialManagementHistory" do
        expect {
          post :create, params: {admin_material_management_history: valid_attributes}
        }.to change(Admin::MaterialManagementHistory, :count).by(1)
      end

      it "redirects to the created admin_material_management_history" do
        post :create, params: {admin_material_management_history: valid_attributes}
        expect(response).to redirect_to(admin_material_management_history_url(Admin::MaterialManagementHistory.last))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {admin_material_management_history: invalid_attributes}
        expect(response).to be_success
      end
    end
  end
  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }
      it "updates the requested admin_material_management_history" do
        admin_material_management_history = create(:admin_material_management_history)
        put :update, params: {id: admin_material_management_history.to_param, admin_material_management_history: new_attributes}
        admin_material_management_history.reload
        skip("Add assertions for updated state")
      end
      it "redirects to the admin_material_management_history" do
        admin_material_management_history = create(:admin_material_management_history)
        put :update, params: {id: admin_material_management_history.to_param, admin_material_management_history: valid_attributes}
        expect(response).to redirect_to(admin_material_management_history_url(admin_material_management_history))
      end
    end
    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        admin_material_management_history = create(:admin_material_management_history)
        put :update, params: {id: admin_material_management_history.to_param, admin_material_management_history: invalid_attributes}
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested admin_material_management_history" do
      admin_material_management_history = create(:admin_material_management_history)
      expect {
        delete :destroy, params: {id: admin_material_management_history.to_param}
      }.to change(Admin::MaterialManagementHistory, :count).by(-1)
    end
    it "redirects to the admin_material_management_histories list" do
      admin_material_management_history = create(:admin_material_management_history)
      delete :destroy, params: {id: admin_material_management_history.to_param}
      expect(response).to redirect_to(admin_material_management_histories_url)
    end
  end
end
