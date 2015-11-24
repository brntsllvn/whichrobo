class CreateBookStores < ActiveRecord::Migration
  def change
    create_table :book_stores do |t|
      t.string :name
      t.string :url

      t.timestamps null: false
    end
  end
end
