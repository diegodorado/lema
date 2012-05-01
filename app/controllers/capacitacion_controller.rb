class CapacitacionController < ApplicationController
  def index
    @courses = Course.order(:title).page(params[:page]).per(10)
    @locales = Category.locales_with_categories
  end
end
