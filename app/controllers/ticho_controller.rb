class TichoController < ApplicationController
  def index
    @books = Book.where('section=?', :te).order('published_at DESC')
  end
  
  def show
    @book = Book.find(params[:id])
  end
end
