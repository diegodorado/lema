class TrayectoriaController < ApplicationController
  def index
    @posts = Post.where('draft=? and section=? and published_at<?', false, :at, 30.days.ago).order('published_at DESC').page(params[:page]).per(10)
    @years = (2000..2010).to_a.reverse.map{|x| {:year => x, :current =>(x == 2009)}}
  end
end
