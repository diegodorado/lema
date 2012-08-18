class CapacitacionController < ApplicationController
  def index
    @courses = Course.order(:title).page(params[:page]).per(10)
    @locales = Category.locales_with_categories
  end
  def locale
    @locale = params[:locale]
    @courses = Course.joins(:category).where('categories.locale=?',@locale).order(:title).page(params[:page]).per(10)
    @locales = Category.locales_with_categories
    render 'index'
  end
  def category
    @category_id = params[:category_id].to_i
    @courses = Course.where('category_id=?',@category_id).order(:title).page(params[:page]).per(10)
    @locale = Category.find(@category_id).locale
    
    @locales = Category.locales_with_categories
    render 'index'
  end
  def show
    @course = params[:id]
    @courses = Course.where('id=?',@course).order(:title).page(params[:page]).per(10)
    @locales = Category.locales_with_categories

    @category_id = @courses.first.category_id
    @locale = Category.find(@category_id).locale

    render 'index'
  end

  def search
    @query = params[:search_query]
    @courses = Course.with_query(@query).order(:title).page(params[:page]).per(10)
    @locales = Category.locales_with_categories

    render 'index'
  end

  
end
