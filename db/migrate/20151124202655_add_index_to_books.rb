class AddIndexToBooks < ActiveRecord::Migration
  def change
    add_index :books, :book_store_id
  end
end
