class NrelService
  def initialize

  end

  def search_by_postal_code(search_params)
    location = search_params.keys.first.to_s
    param = search_params.values.last

    response = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1.json?api_key=#{ENV['API_KEY']}&limit=10&postal_code=80203")
    data = parse( response.body )
  end

  def parse(end_point_data)
    JSON.parse( end_point_data )
  end
end
