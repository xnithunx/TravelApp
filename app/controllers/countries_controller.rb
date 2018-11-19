class CountriesController < ApplicationController

    before_action :authenticate_user!, :except => [ :show, :index ]

  def new
    @plan = Plan.find(params[:plan_id])
    @country = Country.new
  end

  # def edit
  #   @product = Product.find(params[:product_id])
  #   @comment = Comment.find(params[:id])
  #   if @comment.user != current_user
  #     redirect_to @products
  #   end
  # end

  def create
    @country = Country.new(country_params)
    @plan = Plan.find(params[:plan_id])
    @country.plan = @plan
    @country.user = current_user

    @country.save (user_id: current_user.id, id: @plan.id)

  end

  def update
    @country = Country.find(params[:id])
    @plan = @country.plan
    @country.update(country_params)

    redirect_to root_path
  end

  # def destroy
  #   @comment = Comment.find(params[:id])

  #   if @comment.user = current_user
  #     @comment.destroy
  #     @product = Product.find(params[:product_id])
  #     redirect_to user_product_path(user_id: current_user.id, id: @product.id)
  #   else
  #     @product = Product.find(params[:product_id])
  #     redirect_to user_product_path(user_id: current_user.id, id: @product.id)
  #   end
  # end

  private
  def country_params
    params.require(:country).permit(:country_name, :user_id, :plan_id)
  end
end