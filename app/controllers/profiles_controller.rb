class ProfilesController < ApplicationController
  before_action :find_user, only:[:index,:new,:edit,:update, :create]
  before_action :authenticate_user!
  before_action :confirmation_user ,except: [:index]
  
  def index
    @profile = Profile.find_by(user_id: @user.id)
    @posts = Post.where(user_id: @user.id)
    profile_today = Profile.where(created_at: Date.today.all_day).where(user_id: @user.id)
    @profile_today = profile_today[0]
    if @profile_today.present?
      caluculate_bmi
    end
    @profiles = Profile.where(user_id: @user.id)
    weight_data
    fat_rate_data
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile= Profile.new(profile_params)
    if @profile.save
      redirect_to  "/users/#{@user.id}/profiles"
    else
      render :new
    end
  end

  def edit
    profile_today = Profile.where(created_at: Date.today.all_day)
    @profile = profile_today[0]
  end

  def update
    profile_today = Profile.where(created_at: Date.today.all_day)
    @profile = profile_today[0]
    if @profile.update(profile_params)
      redirect_to "/users/#{@user.id}/profiles"
    else
      render :edit
    end
  end




  private 
  def profile_params
    params.require(:profile).permit(:weight,:height,:fat_rate).merge(user_id: current_user.id) 
  end

  def caluculate_bmi
    height_m = @profile_today.height/100
    height = height_m*height_m
    bmi = @profile_today.weight/height
    @bmi = bmi.round(1)
  end 

  def find_user 
    @user = User.find(params[:user_id])
  end

  def weight_data
    @weight_data = []
    @profiles.each do |profile|
      @data = []
      @dates = profile.created_at.strftime('%Y/%m/%d')
      @data.push(@dates)
      @data.push(profile.weight)
      @weight_data.push(@data)
    end 
  end

  def fat_rate_data
    @fat_rate_data = []
    @profiles.each do |profile|
      @data = []
      @dates = profile.created_at.strftime('%Y/%m/%d')
      @data.push(@dates)
      @data.push(profile.fat_rate)
      @fat_rate_data.push(@data)
    end 
  end

  def user_confirmation
    unless current_user.id === @profile.user_id
      redirect_to root_path
    end
  end
end
