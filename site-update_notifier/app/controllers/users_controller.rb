class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @resources = @user.resources.paginate(:page => params[:page])
    @title = @user.name
  end  
end

