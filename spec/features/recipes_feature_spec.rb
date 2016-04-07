
RSpec.describe 'NewRecipe' do
  before :each do
    login_as(create(:user),scope: :user)
  end
  
  describe "New Recipe", :js => true do
    it 'has expected behaviour' do
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
  end

end 