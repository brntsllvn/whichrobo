class ChangeReturnName < ActiveRecord::Migration
  def change
    rename_column :portfolio_level_data, :return, :rtn
  end
end
