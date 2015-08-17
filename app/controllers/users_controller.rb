class UsersController < ApplicationController

  def new
    @user = User.new
    respond_to do |format|
      format.html { redirect_to signup_path(@user) }
      format.js
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @following = Follower.exists?(follower: current_user, user: @user)
    @stats = {"streak" => @user.find_current_streak, "Workouts This Month" => @user.workouts_this_month.count, "Workouts This Week" => @user.workouts_this_week.count, "Total Workouts" => @user.workouts.count}
    streak = @user.find_current_streak
    streak == 1 ? @streak = "#{streak} day" : @streak = "#{streak} days"
    @recent_workouts = @user.workouts.where(:date => 1.week.ago.beginning_of_day..Time.now).order('date DESC')
    # @recent_workouts = @user.workouts.order('date DESC').limit(4)
    @date = params[:month] ? Date.parse(params[:month] + '-01') : Date.today
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end