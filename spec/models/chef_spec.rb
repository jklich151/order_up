require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "instance methods" do
    it "#my_ingredients" do
      chef_1 = Chef.create(name: "Jenny")
      dish_1 = Dish.create(name: "Pasta",
                          description: "yummy",
                          chef: chef_1)
      dish_2 = Dish.create(name: "cheesecake",
                          description: "sweet",
                          chef: chef_1)
      ingredient_1 = Ingredient.create(name: "noodles",
                                      calories: "200")
      ingredient_2 = Ingredient.create(name: "sauce",
                                      calories: "100")
      ingredient_3 = Ingredient.create(name: "ground beef",
                                      calories: "150")
      ingredient_4 = Ingredient.create(name: "cheese",
                                      calories: "200")
      ingredient_5 = Ingredient.create(name: "batter",
                                      calories: "500")

      dish_1.ingredients << ingredient_1
      dish_1.ingredients << ingredient_2
      dish_1.ingredients << ingredient_3
      dish_1.ingredients << ingredient_4
      dish_2.ingredients << ingredient_5
      dish_2.ingredients << ingredient_4

      expect(chef_1.my_ingredients[0].name).to eq(ingredient_1.name)
      expect(chef_1.my_ingredients[1].name).to eq(ingredient_2.name)
      expect(chef_1.my_ingredients[2].name).to eq(ingredient_3.name)
      expect(chef_1.my_ingredients[3].name).to eq(ingredient_4.name)
      expect(chef_1.my_ingredients[4].name).to eq(ingredient_5.name)
    end
  end
end
