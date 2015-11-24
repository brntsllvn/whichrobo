class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :author
      t.decimal :new_price
      t.integer :new_in_stock
      t.decimal :used_price
      t.integer :used_in_stock
      t.decimal :rent_price
      t.integer :rent_in_stock

      t.timestamps null: false
    end
  end
end
