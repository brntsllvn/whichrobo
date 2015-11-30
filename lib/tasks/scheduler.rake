desc "This task is called by the Heroku scheduler add-on"
task :scrape_wealthfront => :environment do



  agent = Mechanize.new
  page = agent.get ENV["WF_PORT_URI"] # TODO: update in Heroku git with final URI when portfolio created
  login_form = page.forms.first

  login_form.email    = ENV["WF_EMAIL"] 
  login_form.password = ENV["WF_PASSWORD"]

  home_page = login_form.submit

  @login = page.title # add to specs
  @home  = home_page.title # add to specs
  @portfolio_title = home_page.search(".current-title").text # add to specs

  total_value      = home_page.search(".ofa-total-and-return > h2").text.delete(',').delete('$').to_i
  rtn              = home_page.search(".dash-sidebar-subinfo").text.delete('%').to_f
  harvested_losses = home_page.search(".tlh-sidebar-subhead-amt-harvested").text.delete(',').delete('$').to_i

  PortfolioLevelDatum.create(
    total_value: total_value, 
    rtn: rtn, 
    harvested_losses: harvested_losses, 
    portfolio_id: Portfolio.wf.first.id)

  # Holdings

  # asset class
  scraped_asset_classes     = home_page.search("td > span > a.ktip-a").map(&:text).map(&:strip)
  wealthfront_asset_classes = ["U.S. Stocks", "Foreign Stocks", "Emerging Markets", 
    "Dividend Stocks", "Natural Resources", "Municipal Bonds", "TIPS"]
  puts ast_cls = ( scraped_asset_classes & wealthfront_asset_classes ) + ["Cash"] + ["Overall"]

  # pct
  pct = home_page.search("td.pct").map(&:text).map(&:strip).map{ |e| e.gsub('%', '') }.map(&:to_f) #.inject{|sum,x| sum + x }
  puts pct_total = pct + [pct.inject(:+)]

  # mkt_val
  mkt_val = home_page.search("td.value").map(&:text).map(&:strip)

  # cost basis
  basis   = home_page.search("td.basis").map(&:text).map(&:strip)

  # gain
  gain    = home_page.search("td.gain").map(&:text).map(&:strip)

  #   ast_cls.each_with_index do |holding, index|
  #     Holding.create(
  #       asset_class: ast_cls[index],
  #       pct: ,
  #       market_value: ,
  #       cost_basis: ,
  #       gain: ,
  #       portfolio_id: Portfolio.wf.first.id)
  #   end


  #transactions
  #   transactions_page = home_page.link_with(href: "/accounts/60823/transactions").click

  #   @trans_date = transactions_page.search(".historical_transaction-row > td.date").map(&:text).map(&:strip)
  #   @trans_act  = transactions_page.search(".historical_transaction-row > td.activity").map(&:text).map(&:strip)
  #   @trans_amt  = transactions_page.search(".historical_transaction-row > td.numeric.amount").map(&:text).map(&:strip)

end

task :scrape_betterment => :environment do
end