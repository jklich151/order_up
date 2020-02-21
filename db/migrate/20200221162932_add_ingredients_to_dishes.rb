class AddIngredientsToDishes < ActiveRecord::Migration[5.1]
  def change
    add_reference :dishes, :ingredient, foreign_key: true
  end
end
