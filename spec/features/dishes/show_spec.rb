require 'rails_helper'

RSpec.describe "Dishes Show Page" do
  it "can see the name of the chef that made the dish" do
  chef_1 = Chef.create(name: "Jenny")
  dish_1 = Dish.create(name: "Pasta",
                      description: "yummy",
                      chef: chef_1)

  visit "/dishes/#{dish_1.id}"

  expect(page).to have_content("Pasta")
  expect(page).to have_content("Jenny")
  end

  it "can see a list of ingredients for the dish" do
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

    visit "/dishes/#{dish_1.id}"

    expect(page).to have_content("Pasta")
    expect(page).to have_content("noodles")
    expect(page).to have_content("sauce")
    expect(page).to have_content("ground beef")
    expect(page).to have_content("cheese")
  end

  it "can see calorie count for this dish" do
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

    visit "/dishes/#{dish_1.id}"

    expect(page).to have_content("total calories: 650")
end
end
