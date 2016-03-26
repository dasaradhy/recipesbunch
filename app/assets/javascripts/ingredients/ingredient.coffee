class @Ingredients.Ingredient
  constructor: (ingredients) ->
    ingredient_div=$('<div class="input-group"/>')
    ingredient_input=$('<input type="text" class="form-control ingredient_input" name="ingredient[]"/>')
    ingredient_div.append(ingredient_input)

    ingredient_remove=$('<span class="input-group-addon remove-ingredient"><i class="fa fa-remove"/></span>')
    ingredient_remove.click ->
      ingredients.remove_ingredient(ingredient_div)

    ingredient_div.append(ingredient_remove)
    ingredients.add_new_ingredient(ingredient_div)
    
