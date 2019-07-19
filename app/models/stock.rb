class Stock < ApplicationRecord
  def self.new_from_lookup(ticker_symbol)
    if StockQuote::Stock.api_key.nil?
      debugger
      StockQuote::Stock.new(api_key: ENV['api_key'])
    end
    begin
      stock = StockQuote::Stock.quote(ticker_symbol)
      new(name: stock.company_name, ticker: stock.symbol,
            last_price: stock.latest_price)
    rescue Exception => e
      nil
    end
  end
end
