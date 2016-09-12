class NrelService
  def initialize
    @@connection ||= Faraday.new(:url => "https://developer.nrel.gov/api/") do |faraday|
      faraday.params['api_key'] = ENV['API_KEY']
    end
  end

  def search_by_location(search_params)
    response = @@connection.get('alt-fuel-stations/v1.json?') do |faraday|
      faraday.params["#{search_params.keys.first}"] = search_params.values.last
      faraday.params['limit'] = 10
      # faraday.params['api_key'] = ENV['API_KEY']
    end
    require 'pry'; binding.pry
    data = response.body
    # "https://developer.nrel.gov/api/alt-fuel-stations/v1.json?postal_code=80203&limit=10&api_key=#{ENV[API_KEY]}"
  end
end
