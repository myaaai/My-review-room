class ItemsController < ApplicationController
  def search
    @user = current_user
    # @post_images = PostImage.all
    #binding.pry
  end
end
