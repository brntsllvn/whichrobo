class BookStore < ActiveRecord::Base
  acts_as_paranoid
  
  has_many :books, dependent: :destroy
end
