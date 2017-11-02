class BestBuyService

  def initialize
    @api_key = ENV["API_KEY"]
    @conn = Faraday.new("https://api.bestbuy.com/v1/") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  # def show
  #   @info = 'storeId,longName,city,distance,storeType,phone'
  # end

  def stores_by_zip(zip)
    response = conn.get("stores(area(#{zip},25))?format=json&show=storeId,longName,city,distance,storeType,phone&pageSize=10&apiKey=#{api_key}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.stores_by_zip(zip)
    new.stores_by_zip(zip)
  end

  private

    attr_reader :api_key,
                :show,
                :conn,
                :info

end