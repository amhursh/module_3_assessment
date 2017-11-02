class SearchController < ApplicationController

  def index
    @zip = params[:zipp]
    @stores_by_zip = Store.search_by_zip(@zip)
    @store_count = Store.total_count(@zip)
  end

end