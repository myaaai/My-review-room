class CategoriesController < ApplicationController
def index
    @categories = Category.all
    @category = Category.new

end

def create
    category = Category.new(category_params)
    category.save
    redirect_to categories_path
end

def edit
    @category = Category.find(params[:id])

end

def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path
      flash[:success] = "編集に成功しました"
    else
      flash[:danger] = "編集に失敗しました"
      render :edit
    end

end

private

 def category_params
    params.require(:category).permit(:name, :is_enabled)
 end


end
