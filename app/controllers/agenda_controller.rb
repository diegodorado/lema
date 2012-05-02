class AgendaController < ApplicationController
  def index
    @posts = Post.where('draft=? and section=?', false, :ag).order('published_at DESC').page(params[:page]).per(10)
  end
end
