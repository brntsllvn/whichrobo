class Portfolio < ActiveRecord::Base
  has_many :portfolio_level_data
  has_many :transactions
  has_many :holdings
end
