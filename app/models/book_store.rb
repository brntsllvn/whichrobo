class BookStore < ActiveRecord::Base
  has_many :books, dependent: :destroy
end
