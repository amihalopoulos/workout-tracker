class WorkoutsController < ApplicationController

  def new
    user = User.find(params[:user_id])
    @workout = user.workouts.new
  end

  def create
    user = User.find(params[:user_id])
    @workout = user.workouts.new(workout_params)
    if @workout.save
      # redirect_to user_path(user)
      respond_to do |format|
        format.html { redirect_to show_workout_path(@workout) }
        format.js
      end
    else
      redirect_to new_user__workout_path(user)
    end
  end

  def show
    # @user = User.find(params[:id])
    params[:workout_id] ? @workout = Workout.find(params[:workout_id]) : @workout = Workout.find(params[:id])
  end

  def edit
    # @user = User.find(params[:id])
    @workout = Workout.find(params[:id])
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :date)
  end

end