class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :date
      t.string :activity
      t.string :amount

      t.timestamps null: false
    end
  end
end
