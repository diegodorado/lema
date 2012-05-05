class AgendaController < ApplicationController
  def index
    @posts = Post.where('draft=? and section in(?)', false, [:ag, :at]).order('published_at DESC').page(params[:page]).per(10)
  end
end
