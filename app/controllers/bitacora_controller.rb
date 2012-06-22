class BitacoraController < ApplicationController
  def index
    @posts = Post.where('draft=? and section=?', false, :bt).order('published_at DESC').page(params[:page]).per(10)
  end
  
  def feed
    @posts = Post.where('draft=?', false).order('published_at DESC').all
    render :layout => false
  end
  
end
