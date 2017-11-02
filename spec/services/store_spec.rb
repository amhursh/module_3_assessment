require 'rails_helper'


describe Store do
  it "exists" do
    valid_attrs = {
      longName: "Cool Store",
      city: "Denver",
      distance: 3.5,
      phone: "303-270-9189",
      storeType: "Big Box"
    }

    store = Store.new(valid_attrs)
    expect(store.long_name).to eq("Cool Store")
    expect(store.city).to eq("Denver")
    expect(store.distance).to eq(3.5)
    expect(store.type).to eq("Big Box")
    expect(store.phone_number).to eq("303-270-9189")
  end

  context ".search_by_zip(zip)" do
    it "returns first 10 store objects" do
      stations = Store.search_by_zip("80203")
      expect(stations.count).to eq(10)
      expect(stations.first).to be_a(Store)
    end
  end

  context ".total_count(zip)" do
    it "returns the total count of stores" do
      count = Store.total_count("80203")
      expect(count).to eq(17)
    end
  end
end