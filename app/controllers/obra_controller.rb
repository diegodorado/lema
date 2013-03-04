class ObraController < ApplicationController
  def index
    @books = Book.where('draft=? and section=?',false, :oe).order('published_at DESC')
  end
  
  def show
    @book = Book.find(params[:id])
  end
end
