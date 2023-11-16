class Stock < ApplicationRecord
  validates :name, presence: true
  validates :ticker, presence: true
  has_many :user_stocks
  has_many :users, through: :user_stocks

  def self.stock_lockup(ticker)
    client = IEX::Api::Client.new(
    publishable_token: Rails.application.credentials.dig(:iex_stock,:publishable_token),
    secret_token: Rails.application.credentials.dig(:iex_stock,:secret_token),
    endpoint: 'https://cloud.iexapis.com/v1'
    )
    begin
      new(name: client.company(ticker).company_name, ticker: ticker, last_price: client.price(ticker))
    rescue => exception
      return nil
    end
  end

end
