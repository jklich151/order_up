require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "instance methods" do
    it "#total_calories" do
      chef_1 = Chef.create(name: "Jenny")
      dish_1 = Dish.create(name: "Pasta",
                          description: "yummy",
                          chef: chef_1)
      ingredient_1 = Ingredient.create(name: "noodles",
                                      calories: "200")
      ingredient_2 = Ingredient.create(name: "sauce",
                                      calories: "100")
      ingredient_3 = Ingredient.create(name: "ground beef",
                                      calories: "150")
      ingredient_4 = Ingredient.create(name: "cheese",
                                      calories: "200")

      dish_1.ingredients << ingredient_1
      dish_1.ingredients << ingredient_2
      dish_1.ingredients << ingredient_3
      dish_1.ingredients << ingredient_4

      expect(dish_1.total_calories).to eq(650)
    end
  end
end
