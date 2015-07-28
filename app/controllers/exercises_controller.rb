class ExercisesController < ApplicationController

  def new
    # user = User.find(params[:user_id])
    workout = Workout.find(params[:workout_id])
    @exercise = workout.exercises.new
  end

  def create
    # user = User.find(params[:user_id])
    workout = Workout.find(params[:workout_id])
    @exercise = workout.exercises.new(exercise_params)
    if @exercise.save
      redirect_to user_workout_exercise_path(workout.user, workout, @exercise)
    else
      redirect_to show_workout_path(workout)
    end
  end

  def show
    # @user = User.find(params[:id])
    @exercise = Exercise.find(params[:id])
  end

  def edit
    # @user = User.find(params[:id])
    @workout = Workout.find(params[:id])
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name)
  end
end