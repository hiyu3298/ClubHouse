class Users::TeamsController < ApplicationController
  def index
    @teams = Admin.all
  end

  def show
    @team = Admin.find(params[:id])
    @post_images = PostImage.where(admin_id: params[:id]).all
  end

  def search
    @teams = Admin.search(params[:search])
  end
end
