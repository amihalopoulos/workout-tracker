class BodyCategoriesController < ApplicationController
  def new
    @body = BodyCategory.new
  end

  def create
    @body = BodyCategory.new(params[:name])
    if @body.save
      redirect_to root_path
    else
      redirect_to signin_path
    end
  end

  def show
  end
end