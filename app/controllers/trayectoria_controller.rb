class TrayectoriaController < ApplicationController
  def index
    @posts = Post.order(:published_at).page(params[:page]).per(10)
    @years = (2000..2010).to_a.reverse.map{|x| {:year => x, :current =>(x == 2009)}}
  end
end
