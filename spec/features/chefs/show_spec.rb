require 'rails_helper'

RSpec.describe "Chefs Show Page" do
  it "can see name of that chef" do
    chef_1 = Chef.create(name: "Jenny")

    visit "/chefs/#{chef_1.id}"

    expect(page).to have_content("Jenny")
  end

  it "can see a link to view all ingredients of all dishes" do
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

    visit "/chefs/#{chef_1.id}"

    click_link "All Ingredients"

    expect(page).to have_content("noodles")
    expect(page).to have_content("sauce")
    expect(page).to have_content("ground beef")
    expect(page).to have_content("cheese")
    expect(page).to have_content("batter")
  end
end
