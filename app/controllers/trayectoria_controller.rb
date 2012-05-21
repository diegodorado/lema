class TrayectoriaController < ApplicationController
  def index
    @current_year = (params[:year] || Date.today.year).to_i
    @posts = Post.for_year(@current_year).where('draft=? and section=? and published_at<?', false, :at, 30.days.ago).order('published_at DESC').page(params[:page]).per(10)
    @years = Post.select("DISTINCT strftime('%Y', published_at) as year").where('draft=? and section=? and published_at<?', false, :at, 30.days.ago).order('year desc').map{ |row| row.year.to_i }
  end
end
