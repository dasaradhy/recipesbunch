require 'rails_helper'

RSpec.describe "recipes/new.html.haml", type: :view do
  it 'has holder for ingredients' do
    assign(:recipe,Recipe.new)
    render 

    expect(rendered).to have_selector('span#ingredients.form-group')
  end

  it 'has holder for steps' do
    assign(:recipe,Recipe.new)
    render 

    expect(rendered).to have_selector('span#steps.form-group')
  end

end
