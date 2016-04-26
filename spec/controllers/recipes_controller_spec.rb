# == Schema Information
#
# Table name: recipes
#
#  id                  :integer          not null, primary key
#  chef_id             :integer
#  ingredients         :json             default([])
#  steps               :json             default([])
#  preparation_time    :string
#  ease_of_preparation :float
#  taste               :float
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  name                :string
#  images              :json             default([])
#

require 'rails_helper'

RSpec.describe RecipesController, type: :controller do

  let(:recipe){build_stubbed(:recipe)}
  let(:user){create(:user)}

  before do
    allow(Recipe).to receive_messages(find: recipe)
    allow(recipe).to receive_messages(save: recipe)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index  
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "should render 'show' template" do
      get :show, id: recipe.id
      expect(assigns(:recipe)).to eq recipe
      expect(response).to render_template('show')
    end
  end

  describe "GET #new" do
    it "returns http not authorized without login" do
      get :new
      assert_redirected_to new_user_session_path
    end
    it "returns http success" do
      sign_in user
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "POST #create" do
    it "creates recipe and redirects to recipe's page" do
      sign_in user
      get :new
      expect(response).to render_template('new')
      post :create, recipe: FactoryGirl.attributes_for(:recipe)
      expect(response).to redirect_to(action: :show, id: assigns(:recipe).id)
    end
  end

  describe "GET #edit" do
    it "returns http not authorized without login" do
      get :edit, id: recipe.id
      assert_redirected_to new_user_session_path
    end

    it "should raise exception when recipe does not belong to user" do
      allow(recipe).to receive_messages(chef: Chef.first)
      sign_in user
      # expect {
      get :edit, id: recipe.id
      # expect(response).to render_template('edit')
      # }.to raise_error(Pundit::NotAuthorizedError)
      assert_redirected_to root_path
      expect(flash[:alert]).to eq 'Operation not permitted.'
    end

    it "should render 'edit' template" do
      allow(recipe).to receive_messages(chef: user.chef)
      sign_in user
      get :edit, id: recipe.id
      expect(response).to render_template('edit')
    end
  end

  describe "PATCH #update" do
    it "updates recipe and redirects to recipe's page" do
      allow(recipe).to receive_messages(chef: user.chef)
      sign_in user
      get :edit, id: recipe.id
      expect(response).to render_template('edit')
      patch :update, id: recipe.id, recipe: FactoryGirl.attributes_for(:recipe)
      expect(response).to render_template('show')
    end
  end


end
