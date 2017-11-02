require 'rails_helper'

describe 'Items API Request' do
  it 'sends a list of items' do
    create_list(:item, 3)
    # When I send a GET request to `/api/v1/items`
    get '/api/v1/items'
    # I receive a 200 JSON response containing all items
    expect(response).to be_success
    items = JSON.parse(response.body)
    expect(items.count).to eq 3
    # And each item has an id, name, description, and image_url but not the created_at or updated_at
  end
end
