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

    @portfolio_title = home_page.search(".current-title").text
    @account_value = home_page.search(".ofa-total-and-return > h2").text
    @return = home_page.search(".dash-sidebar-subinfo").text

    scraped_asset_classes     = home_page.search("td > span > a.ktip-a").map(&:text).map(&:strip)
    wealthfront_asset_classes = ["U.S. Stocks", "Foreign Stocks", "Emerging Markets", 
      "Dividend Stocks", "Natural Resources", "Municipal Bonds", "TIPS"]
    @ast_cls = ( scraped_asset_classes & wealthfront_asset_classes ) + ["Cash"]
    @pct     = home_page.search("td.pct").map(&:text).map(&:strip)
    @mkt_val = home_page.search("td.value").map(&:text).map(&:strip)
    @basis   = home_page.search("td.basis").map(&:text).map(&:strip)
    @gain    = home_page.search("td.gain").map(&:text).map(&:strip)

    transactions_page = home_page.link_with(href: "/accounts/60823/transactions").click

    @trans_date = transactions_page.search(".historical_transaction-row > td.date").map(&:text).map(&:strip)
    @trans_act  = transactions_page.search(".historical_transaction-row > td.activity").map(&:text).map(&:strip)
    @trans_amt  = transactions_page.search(".historical_transaction-row > td.numeric.amount").map(&:text).map(&:strip)


  end

end
