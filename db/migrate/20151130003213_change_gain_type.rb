class ChangeGainType < ActiveRecord::Migration
  def change
    change_column :holdings, :gain, :decimal
  end
end
