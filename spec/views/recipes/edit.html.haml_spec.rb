require 'rails_helper'

RSpec.describe "recipes/edit.html.haml", type: :view do
  it 'displays recipe details correctly' do
    assign(:recipe,create(:recipe))
    render

    expect(rendered).to match (/#{Recipe::TIMES[5]}/)
  end
end
