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
  end

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
      sign_in user
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http not authorized without login" do
      get :edit, id: recipe.id
      assert_redirected_to new_user_session_path
    end
    it "should render 'edit' template" do
      sign_in user
      get :edit, id: recipe.id
      expect(response).to render_template('edit')
    end
  end

  describe "GET #show" do
    it "should render 'show' template" do
      get :show, id: recipe.id
      expect(assigns(:recipe)).to eq recipe
      expect(response).to render_template('show')
    end
  end

end
