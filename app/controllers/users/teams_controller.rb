class Users::TeamsController < ApplicationController
  def index
    @teams = Admin.all
  end

  def show
    @team = Admin.find(params[:id])
  end
end
