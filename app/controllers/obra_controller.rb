class ObraController < ApplicationController
  def index
    @books = Book.where('section=?', :oe).order(:title)
  end
  
  def show
    @book = Book.find(params[:id])
  end
end
