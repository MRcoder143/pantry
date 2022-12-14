class RecipesController < ApplicationController
  def index
    @recipes =  Recipe.all
  end
  def show
  @recipe = Recipe.find(params[:id])
end
def new
   @recipe = Recipe.new
5.times { @recipe.recipe_ingredients.build.build_ingredient}
 end
 def create
   byebug
   @recipe = Recipe.create(recipe_params)

   if @recipe.save
     redirect_to @recipe
   else
     render action: "new"

   end
 end

 def edit
     @recipe = Recipe.find(params[:id])
   end



     def update
       @recipe = Recipe.find(params[:id])

       if @recipe.update(recipe_params)
         redirect_to @recipe
       else
         render action: "edit"
       end
     end

     def destroy
   @recipe = Recipe.find(params[:id])
   @recipe.destroy

   redirect_to recipes_url
 end

protected
 def recipe_params
 params.require(:recipe).permit(:title, recipe_ingredients_attributes: [:amount, ingredient_attributes: [:name]])
end

end
