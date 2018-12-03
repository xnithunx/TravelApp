class PlansController < ApplicationController
  before_action :authenticate_user!, :except => [ :show, :index ]
  def index
    @plans = Plan.all
  end

  def show
    @plan = Plan.find(params[:id])
     @comments = Comment.where(plan_id: params[:id])
  end

  def new
  end

  def edit
    @plan = Plan.find(params[:id])
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
    @plan = Plan.find(params[:id])

    uploaded_file = params[:plan][:image_url].path
    cloudinary_file = Cloudinary::Uploader.upload(uploaded_file)

    params[:plan][:image_url] = cloudinary_file['public_id']

    @plan.seller = current_user

    @plan.update(plan_params)
    redirect_to user_plan_path(user_id: current_user.id, id: @plan.id)
  end

  def destroy
  end


  def favorite
    @plan = Plan.find(params[:id])
    @favorite = Favorite.find_by(favoritor: current_user, favoritable: @plan)
    current_user.favorite(@plan)


    redirect_to user_plan_path(user_id: current_user.id, id: @plan.id)
  end


  def unfavorite
    @plan = Plan.find(params[:id])
    current_user.remove_favorite(@plan)

    redirect_to user_plan_path(user_id: current_user.id, id: @plan.id)
  end

private
  def plan_params
    params.require(:plan).permit(:title, :address, :description, :activties, :image_url, :user_id)
  end


end


