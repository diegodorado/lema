class TichoController < ApplicationController
  def index
    @books = Book.where('section=?', :te).order(:title)
  end
  
  def show
    @book = Book.find(params[:id])
  end
end
