class @Ingredients

  constructor: (selector,ingredients=[],message="") ->
    @ingredients_cnt=0
    @add_ingredient=$('<input class="btn btn-default form-group" id="add-ingredient-button" type="button" value="Add Ingredient"/>')
    @add_ingredient.click =>
      ingredient = new Ingredients.Ingredient(@)
    $(selector).append('<span class="help-block recipe-help-block">'+message+'</span>') if message!=""
    $(selector).append(@add_ingredient)
    if ingredients.length<=0
      ingredient = new Ingredients.Ingredient(@,"")
    else
      new Ingredients.Ingredient(@,ingrdnt) for ingrdnt in ingredients

  add_new_ingredient: (ingredient) ->
    @ingredients_cnt+=1
    ingredient.insertBefore(@add_ingredient)

  remove_ingredient: (ingredient) ->
    if @ingredients_cnt == 1
      alert("Can't remove all ingredients")
    else
      ingredient.remove()
      @ingredients_cnt-=1