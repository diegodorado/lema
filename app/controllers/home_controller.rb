class HomeController < ApplicationController
  def bitacora
    @posts = Post.order(:published_at).page(params[:page]).per(7)
  end
end
