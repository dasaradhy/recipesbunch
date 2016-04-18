require 'rails_helper'

RSpec.describe "recipes/show.html.haml", type: :view do
  before :each do
    assign(:recipe,FactoryGirl.create(:recipe))
  end

  it "shows 3 ingredients" do
    render
    expect(rendered).to have_selector('.ingredient',count:6)
  end

  it 'shows 2 steps' do
    
  end

end
