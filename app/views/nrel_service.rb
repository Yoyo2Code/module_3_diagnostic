class NrealService

  def initialize
    @@connection ||= Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations")
      # faraday.adapter  Faraday.default_adapter
  end

  def find_by(search_params)
    @@connection do |faraday|
      faraday.params[search_params[0]] = search_params[1]
      faraday.params['api_key'] = ENV[API_KEY]
    end
    # "https://developer.nrel.gov/api/alt-fuel-stations/v1.json?postal_code=80203&limit=10&api_key=#{ENV[API_KEY]}"
  end

end
