class RoundsController < ApplicationController
  def new
    exercise = Exercise.find(params[:exercise_id])
    @round = exercise.rounds.new
    respond_to do |format|
      format.js
    end
  end

  def create
    exercise = Exercise.find(params[:exercise_id])
    @round = exercise.rounds.new(round_params)
    if @round.save
      respond_to do |format|
        format.html { redirect_to user_workout_exercise_path(exercise.workout.user, exercise.workout, exercise) }
        format.js
      end

    else
      redirect_to show_workout_path(exercise.workout)
    end
  end

  def show
    @round = Round.find(params[:id])
  end

  def edit
    @round = Round.find(params[:id])
  end

  private

  def round_params
    params.require(:round).permit(:reps, :weight)
  end

end
