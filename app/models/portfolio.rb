class Portfolio < ActiveRecord::Base
  has_many :portfolio_level_data
  has_many :transactions
  has_many :holdings
  
  scope :wf, -> { where(robo: 'Wealthfront') }
  scope :bt, -> { where(robo: 'Betterment') }
end
