class PlansController < ApplicationController
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
    @plan = Plan.new(plan_params)

  @plan.save
  redirect_to @plan
  end

  def update
  end

  def destroy
  end

private
  def plan_params
    params.require(:plan).permit(:country, :city, :datetime, :description, :datetime)
  end


end


