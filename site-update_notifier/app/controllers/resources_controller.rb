class ResourcesController < ApplicationController
  before_filter :authorized_user, :only => :destroy

  def new
    @resourse = Resourse.new
  end
  
  def create
  	@resource = current_user.resources.build(resource_params)
    UserMailer.welcome_email(current_user).deliver
    
  	if @resource.save
  	  redirect_to root_path, :flash => { :success => "Resource created!"}
    else
      @feed_items = []
      render '/'
    end
  end

  def destroy
    @resource.destroy
    redirect_to root_path, :flash => { :success => "Resource deleted!" }
  end
  
  private
  
    def authorized_user
      @resource = current_user.resources.find_by_id(params[:id])
      redirect_to root_path if @resource.nil?
    end

    def resource_params
      params.require(:resource).permit(:name, :url, :timeout)
    end
end
