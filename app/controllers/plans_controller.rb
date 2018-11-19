class PlansController < ApplicationController
  before_action :authenticate_user!, :except => [ :show, :index ]
  def index
    @plans = Plan.all
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create

    uploaded_file = params[:plan][:image_url].path
    cloudinary_file = Cloudinary::Uploader.upload(uploaded_file)

    params[:plan][:image_url] = cloudinary_file['public_id']

    @plan = Plan.new(plan_params)

      @plan.user = current_user

  @plan.save
  redirect_to user_plan_path(user_id: current_user.id, id: @plan.id)
  end

  def update
  end

  def destroy
  end

private
  def plan_params
    params.require(:plan).permit(:title, :address, :description, :activties, :image_url, :latitude, :longitude, :user_id)
  end


end


