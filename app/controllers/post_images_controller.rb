class PostImagesController < ApplicationController

  def new
    @post_image = PostImage.new
    @categories = Category.all

  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    #byebug
    @post_image.save
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.all
    @user = current_user

  end


  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new

  end

  def edit
    @post_image = PostImage.find(params[:id])
    @categories = Category.all


  end

  def update

  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

  private

  def post_image_params
    params.require(:post_image).permit(:title, :category_id, :name, :image, :memo, :review)
  end

end

