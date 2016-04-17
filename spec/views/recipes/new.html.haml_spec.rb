require 'rails_helper'

RSpec.describe "recipes/new.html.haml", type: :view do
  before :each do
    assign(:recipe,Recipe.new)
  end
  it 'has holder for ingredients' do
    render 

    expect(rendered).to have_selector('span#ingredients.form-group')
  end

  it 'has holder for steps' do
    render 

    expect(rendered).to have_selector('span#steps.form-group')
  end

end
