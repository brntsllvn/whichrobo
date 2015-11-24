class AddBookstoreForeignKey < ActiveRecord::Migration
  def change
    add_column :books, :book_store_id, :integer 
  end
end
