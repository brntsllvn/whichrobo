class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :robo
      t.string :name
      t.string :risk_level

      t.timestamps null: false
    end
  end
end
