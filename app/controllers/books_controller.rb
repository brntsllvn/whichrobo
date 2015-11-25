class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
    respond_to do |format|
      format.html
      format.csv { send_data @books.to_csv }
      format.xls
    end
  end

  private

  def book_params
    params.require(:book).permit(:isbn, :title, :author, :new_price, :new_in_stock, :used_price, :used_in_stock, :rent_price, :rent_in_stock)
  end

end
