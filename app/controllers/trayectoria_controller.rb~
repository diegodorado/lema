class TrayectoriaController < ApplicationController
  def index
    @years = Post.select("DISTINCT strftime('%Y', published_at) as year").where('draft=? and section=? and published_at<?', false, :at, 30.days.ago).order('year desc').map{ |row| row.year.to_i }
    @current_year = params[:year] || @years.first
    @posts = Post.for_year(@current_year).where('draft=? and section=? and published_at<?', false, :at, 30.days.ago).order('published_at DESC').page(params[:page]).per(10)
  end
end
