class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy ]
  before_action :set_categories, only: %i[ new edit ]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save && save_ingredients
      redirect_to @recipe
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params) && save_ingredients
      redirect_to @recipe
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def set_categories
      @categories = Category.all
    end

    def recipe_params
      params.expect(recipe: [ :name, :featured_image, category_ids: [] ])
    end

    def save_ingredients
      old_ingredients = @recipe.ingredients
      params[:recipe][:ingredients].split("\r\n").each do |new_ingredient|
        new_value, new_unit, new_name = new_ingredient.split(" ")
        old_ingredient = old_ingredients.find { |i| i.name == new_name }
        ingredient = old_ingredient || Ingredient.new(name: new_name)
        ingredient.value = new_value
        ingredient.unit = new_unit
        ingredient.recipe = @recipe
        ingredient.save
      end
      return true
    end
end
