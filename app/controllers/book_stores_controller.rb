class BookStoresController < ApplicationController
  before_action :set_book_store, only: [:show, :destroy]

  def index
    @book_stores = BookStore.all
  end

  def show
  end

  private
  
  def set_book_store
    @book_store = BookStore.find(params[:id])
  end
      
  def book_store_params
    params.require(:book_store).permit(:name, :url)
  end
  
end
