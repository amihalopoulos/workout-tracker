class RoundsController < ApplicationController
  def new
    exercise = Exercise.find(params[:exercise_id])
    @round = exercise.rounds.new
  end

  def create
    exercise = Exercise.find(params[:exercise_id])
    @round = exercise.rounds.new(round_params)
    if @round.save
      redirect_to user_workout_exercise_path(exercise.workout.user, exercise.workout, exercise)
    else
      redirect_to show_workout_path(exercise.workout)
    end
  end

  def show
    @round = Round.find(params[:id])
  end

  private

  def round_params
    params.require(:round).permit(:reps, :weight)
  end

end
