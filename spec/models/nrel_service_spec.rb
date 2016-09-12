require 'rails_helper'

RSpec.describe NrelService, type: :model do
  it "can search by postal code" do
    VCR.use_cassette("nrel_service_postal_code") do
    stations = NrelService.new.search_by_location(postal_code: 80203)
    station = stations.first

    expect(stations.count).to eq(10)
    expect(station[:first_name]).to eq("Joni")
    expect(station[:last_name]).to eq("Ernst")
    end
  end
end
