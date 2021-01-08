class ProfilesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @profile = Profile.find_by(user_id: @user.id)
    if @profile.present?
      caluculate_bmi
    end
    @posts = Post.where(user_id: @user.id)
  end

  def new
    @profile = Profile.new
    @user = User.find(params[:user_id])
  end

  def create
    @profile= Profile.new(profile_params)
    if @profile.save
      redirect_to new_user_profile_path(params[:user_id])
    else
      render :new
    end
  end


  private 
  def profile_params
    params.require(:profile).permit(:weight,:height,:fat_rate).merge(user_id: current_user.id) 
  end

  def caluculate_bmi
    height_m = @profile.height/100
    height = height_m*height_m
    bmi = @profile.weight/height
    @bmi = bmi.round(1)
  end 
  
end
