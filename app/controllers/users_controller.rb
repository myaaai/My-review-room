class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
    @post_images = current_user.post_images

  end

  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to users_path
  end

  def edit
    @user = current_user
  end

  def withdraw
    @user = current_user

  end

  def destroy
    user = User.find(params[:id])
    user.update(is_deleted: true)
    flash[:success] = "アカウントを削除しました"
    redirect_to root_path

  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :gender, :birth_date)
  end
end
