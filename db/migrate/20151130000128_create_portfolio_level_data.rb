class CreatePortfolioLevelData < ActiveRecord::Migration
  def change
    create_table :portfolio_level_data do |t|
      t.integer :total_value
      t.decimal :return
      t.integer :harvested_losses
      t.integer :portfolio_id
      
      t.timestamps null: false
    end
  end
end
