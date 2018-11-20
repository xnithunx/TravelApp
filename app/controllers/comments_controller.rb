class CommentsController < ApplicationController

    before_action :authenticate_user!, :except => [ :show, :index ]

  def new
    @plan = Plan.find(params[:plan_id])
    @comment = Comment.new
  end

  def edit
    @plan = Plan.find(params[:plan_id])
    @comment = Comment.find(params[:id])
    if @comment.user != current_user
      redirect_to @plans
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @plan = Plan.find(params[:plan_id])
    @comment.plan = @plan
    @comment.user = current_user

    if @comment.save
      redirect_to user_plan_path(user_id: current_user.id, id: @plan.id)
    else
      redirect_to root_path
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @plan = @comment.plan
    @comment.update(comment_params)

    redirect_to user_plan_path(user_id: current_user.id, id: @plan.id)
  end

  def destroy
    @comment = Comment.find(params[:id])

    if @comment.user = current_user
      @comment.destroy
      @plan = Plan.find(params[:plan_id])
      redirect_to user_plan_path(user_id: current_user.id, id: @plan.id)
    else
      @plan = Plan.find(params[:plan_id])
      redirect_to user_plan_path(user_id: current_user.id, id: @plan.id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_comment, :user_id, :plan_id)
  end
end