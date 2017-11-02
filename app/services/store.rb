class Store

  attr_reader :long_name,
              :city,
              :distance,
              :phone_number,
              :type

  def initialize(attrs)
    @long_name = attrs[:longName]
    @city = attrs[:city]
    @distance = attrs[:distance]
    @phone_number = attrs[:phone]
    @type = attrs[:storeType]
  end

  def self.search_by_zip(zip)
    stores = BestBuyService.stores_by_zip(zip)[:stores]
    stores.map do |store|
      Store.new(store)
    end
  end

  def self.total_count(zip)
    BestBuyService.stores_by_zip(zip)[:total]
  end

end