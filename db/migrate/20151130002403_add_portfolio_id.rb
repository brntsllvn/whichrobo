class AddPortfolioId < ActiveRecord::Migration
  def change
    add_column :transactions, :portfolio_id, :integer
  end
end
