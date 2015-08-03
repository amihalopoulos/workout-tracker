class ExerciseCategoriesController < ApplicationController
  def new
    @exercise_cat = ExerciseCategory.new
  end

  def create
    @exercise_cat = ExerciseCategory.new(params[:name, :body_category_id])
    if @exercise_cat.save
      redirect_to root_path
    else
      redirect_to sigin_path
    end
  end

  def show
  end
end