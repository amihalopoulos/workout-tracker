class ExercisesController < ApplicationController
  autocomplete :exercise, :name, :full => true

  def new
    # user = User.find(params[:user_id])
    workout = Workout.find(params[:workout_id])
    @exercise = workout.exercises.new
    respond_to do |format|
        format.js
      end
  end

  def create
    # user = User.find(params[:user_id])
    workout = Workout.find(params[:workout_id])
    @exercise = workout.exercises.new(exercise_params)
    if @exercise.save
      respond_to do |format|
        format.html { redirect_to user_workout_exercise_path(workout.user, workout, @exercise) }
        format.js
      end
    else
      redirect_to show_workout_path(workout)
    end
  end

  def show
    # @user = User.find(params[:id])
    @exercise = Exercise.find(params[:id])
  end

  def edit
    @exercise = Exercise.find(params[:id])
    respond_to do |format|
      format.html { redirect_to user_path(@user) }
      format.js
    end
  end

  def update
    @exercise = Exercise.find(params[:id])
    if @exercise.update_attributes(exercise_params)
      respond_to do |format|
        format.html { redirect_to user_path(@exercise.user) }
        format.js
      end
    else
      redirect_to user_path(@exercise.user)
    end
  end

  def chart
    @exercise = Exercise.find(params[:id])
    @exercises = Exercise.where(name: @exercise.name, user_id: current_user.id)
  end

   def index
    hash = {}
    @exercises = current_user.exercises.index_by {|r| r[:name]}.values
    @exercises.each do |e|
      sets = e.rounds.count
      hash[e] = sets
    end
    @hash = hash.sort_by {|key, value| value}.reverse
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.js
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :user_id, rounds_attributes: [:id, :reps, :weight, :_destroy]).merge(user_id: current_user.id)
  end
end