class Admins::PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.admin_id = current_admin.id
    if @post_image.save
      redirect_to admins_post_image_path(@post_image)
    else
      render :new
    end
  end

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to admins_post_images_path
  end

  private

  def post_image_params
    params.require(:post_image).permit(:practice_name, :image, :tweet, :admin_id)
  end
end
