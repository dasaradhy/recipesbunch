require 'rails_helper'

RSpec.describe RecipesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index  
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http not authorized without login" do
      get :new
      assert_redirected_to new_user_session_path
    end
    it "returns http success" do
      sign_in create(:user)
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http not authorized without login" do
      get :edit, id: create(:recipe)
      assert_redirected_to new_user_session_path
    end
    it "returns http success" do
      sign_in create(:user)
      get :edit, id: create(:recipe)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: create(:recipe)
      expect(response).to have_http_status(:success)
    end
  end

end
