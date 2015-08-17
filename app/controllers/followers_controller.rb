class FollowersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @followers = @user.followers.map(&:user)
    @following = @user.following.map(&:user)
    @feed_list = {}
    @following.each { |f| @feed_list[f] = f.workouts_this_month }
  end

  def create
    @user = User.find(params[:user_id])
    follow = @user.followers.build(follower: current_user)
    if follow.save
      respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js
      end
    end
  end

  def destroy
    follow = Follower.find(params[:id])
    @user = follow.user
    if follow.destroy
      respond_to do |format|
        format.html { redirect_to user_path(user) }
        format.js
      end
    end
  end
end
