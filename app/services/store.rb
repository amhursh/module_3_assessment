class Store

  def self.search_by_zip(zip)
    stores = BestBuyService.stores_by_zip(zip)
    stores.map do |store|
      Store.new(store)
    end
  end

end