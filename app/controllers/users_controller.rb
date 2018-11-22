class UsersController < ApplicationController
  def show
    if current_user
        @user = User.find(params[:id])
        @listedplans = Plan.where(user_id: params[:id])

    else
      redirect_to new_user_session_path
    end
  end


  def follow
    @user = User.find(params[:id])
    @follow = Follow.find_by(follower: current_user, followable: @user)
    current_user.follow(@user)
  end

  # def unfollow
  #   @user = User.find(params[:id])
  #   current.user.stop_following(@user)
  # end

end