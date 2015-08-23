class SearchController < ApplicationController

  def new
    @search = params[:search]
    @exercise = search_exercises(@search)
    @user_results = search_users(@search)
    respond_to do |format|
      format.js
    end
  end

  def search_exercises(search)
    Exercise.where('LOWER(name) LIKE?', "%#{search.downcase}%").where(user: current_user).first if search
  end

  def search_users(search)
    if search
      User.where('LOWER(name) LIKE ?', "%#{search.downcase}%")
    end
  end

end