require 'rails_helper'

RSpec.feature 'Recipe' do

  scenario "New Recipe without login" do
    visit 'recipes/new'
    expect(current_path).to eq new_user_session_path
  end

  scenario "New Recipe with login", :js => true do

      login_as(create(:user),scope: :user)
      visit '/recipes/new'
      expect(page).to have_selector 'input#recipe_name'
      expect(page).to have_selector 'input.ingredient_input'
      expect(page).to have_selector 'input#add-ingredient-button'
      expect(page).to have_selector 'span.remove-ingredient'

      find(:css,'span.remove-ingredient').click
      expect(page.driver.browser.switch_to.alert.text).to eq "Can't remove all ingredients"
      page.driver.browser.switch_to.alert.accept

      find(:css,'input#add-ingredient-button').click
      expect(page).to have_selector('input.ingredient_input',count:2)

      expect(page).to have_selector('textarea.step_input',visible: false)
      expect(page).to have_selector 'input#add-step-button'
      expect(page).to have_selector 'button.remove-step'

      find(:css,'button.remove-step').click
      expect(page.driver.browser.switch_to.alert.text).to eq "Can't remove all steps"
      page.driver.browser.switch_to.alert.accept

      find(:css,'input#add-step-button').click
      expect(page).to have_selector('textarea.step_input',visible: false,count:2)

  end

  scenario "Show Recipe", :js => true  do
    login_as(create(:user),scope: :user)
    visit '/recipes/new'

    fill_in "Name", with: "Test Recipe"
    select "15 minutes", from: "Preparation time"
    find(:css,'input.ingredient_input').set 'Ingredient 1'
    find(:css,'#add-ingredient-button').click
    find(:css,'div.panel-body[contenteditable]').set 'Step1'
    find(:css,'input#add-step-button').click
    find(:xpath,'//input[@type=\'submit\']').click

    expect(page).to have_text('Test Recipe')
    
  end


end 