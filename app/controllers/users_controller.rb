class UsersController < ApplicationController
  def index
    @mates = current_user.matchers
    users_id = current_user.followings.pluck(:id)
    pp users_id
    users_id.push(current_user.id)
    pp users_id
    @users = User.where.not(id: users_id)
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @post_images = current_user.post_images

  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
    render :edit
    end
  end

  def edit
    @user = current_user
    if current_user.id != @user.id
    redirect_to users_path
    end

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
