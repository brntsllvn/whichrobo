class AddDeletedAtToBookStores < ActiveRecord::Migration
  def change
    add_column :book_stores, :deleted_at, :datetime
    add_index  :book_stores, :deleted_at
    add_column :books,       :deleted_at, :datetime
    add_index  :books,       :deleted_at
  end
end
