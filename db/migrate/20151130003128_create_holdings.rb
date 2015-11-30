class CreateHoldings < ActiveRecord::Migration
  def change
    create_table :holdings do |t|
      t.string :asset_class
      t.decimal :pct
      t.integer :market_value
      t.integer :cost_basis
      t.integer :gain
      t.integer :portfolio_id

      t.timestamps null: false
    end
  end
end
