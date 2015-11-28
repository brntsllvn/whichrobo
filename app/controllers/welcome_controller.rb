class WelcomeController < ApplicationController

  def index
    agent = Mechanize.new
    @page = agent.get('https://www.wealthfront.com/login')
  end
  
end
