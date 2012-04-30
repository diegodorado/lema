class AgendaController < ApplicationController
  def index
    @posts = Post.order(:published_at).page(params[:page]).per(10)
  end
end
