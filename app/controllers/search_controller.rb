class SearchController < ApplicationController
  def index
    nrel_service.search_by_postal_code(search_params)
  end

  private

  def search_params
    params.require(:q).permit(:commit, :q)
  end
end
