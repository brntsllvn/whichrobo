class Book < ActiveRecord::Base
  acts_as_paranoid
  
  belongs_to :book_store
end
