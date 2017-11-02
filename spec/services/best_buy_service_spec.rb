require 'rails_helper'

describe BestBuyService do
  context ".stores_by_zip(zip)" do
    it "returns store search info including stores" do
      raw_stores = BestBuyService.stores_by_zip("80203")[:stores]
      expect(raw_stores.count).to eq(10)
    end
  end
end