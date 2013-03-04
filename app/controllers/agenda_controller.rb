class AgendaController < ApplicationController
  def index
    @posts = Post.where('draft=? and section in(?) and published_at>?', false, [:ag, :at], 30.days.ago).order('published_at DESC').page(params[:page]).per(10)
  end
end
