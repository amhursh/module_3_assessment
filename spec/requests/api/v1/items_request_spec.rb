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
    expect(items.first["created_at"]).to eq nil
    expect(items.first["updated_at"]).to eq nil
  end

  it 'sends a single item' do
    create_list(:item, 3)
    item = Item.last
    # When I send a GET request to `/api/v1/items/1`
    get "/api/v1/items/#{item.id}"
    # I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
    expect(response).to be_success
    item_response = JSON.parse(response.body)
    expect(item_response["id"]).to eq item.id
    expect(item_response["name"]).to eq item.name
    expect(item_response["description"]).to eq item.description
    expect(item_response["image_url"]).to eq item.image_url
    expect(item_response["created_at"]).to eq nil
    expect(item_response["updated_at"]).to eq nil
  end

  it 'deletes a single item' do
    create_list(:item, 3)
    item = Item.last
    # When I send a DELETE request to `/api/v1/items/1`
    delete "/api/v1/items/#{item.id}"
    # I receive a 204 JSON response if the record is successfully deleted
    expect(response).to be_success
    expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'creates an item' do
    item_params = {
      name: 'aaron',
      description: 'the best item',
      image_url: 'www.google.com'
    }
    post '/api/v1/items', params: {item: item_params}
    # When I send a POST request to `/api/v1/items` with a name, description, and image_url
    item = Item.last
    # I receive a 201 JSON  response if the record is successfully created
    assert_response :success
    # And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
    expect(response).to be_success
    expect(item.name).to eq item_params[:name]
    expect(item.description).to eq item_params[:description]
  end
end
