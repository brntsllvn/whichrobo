class WelcomeController < ApplicationController

  def index
    agent = Mechanize.new
    page = agent.get('https://www.wealthfront.com/login')
    login_form = page.forms.first

    login_form.email    = ENV["WF_EMAIL"] 
    login_form.password = ENV["WF_PASSWORD"]

    home_page = login_form.submit

    @login = page.title
    @home  = home_page.title
  end

end
