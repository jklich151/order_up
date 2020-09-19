class ChefIngredientsController < ApplicationController
  def index
    chef = Chef.find(params[:id])
    @ingredients = chef.my_ingredients
  end
end
