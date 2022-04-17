class CategoriesController < ApplicationController
def index
    @categories = Category.all
    @category = Category.new
    @user = current_user

end

def create
    category = Category.new(category_params)
    category.user = current_user
    category.save
    redirect_to categories_path
end

def show
  @category = Category.find(params[:id])
  @post_images = @category.post_images
  @user = current_user

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
    params.require(:category).permit(:name, :profile_image, :is_enabled)
 end


end
