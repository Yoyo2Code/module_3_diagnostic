require 'rails_helper'

RSpec.describe "SearchUsingLocaitons", type: :request do
  describe "GET /search_using_locaitons" do
    it "can filter search by location" do
      VCR.use_cassette("sunlight_service_legislators") do

        visit "/"

        fill_in :Search_by_zip, with: "80203"

        click_on "Locate"

        expect(page.path).to eq("/search?location=80203")

        expect(page).to have_content("Station") # 6 stations?

        expect(page).to have_content("Electric")
        expect(page).to have_content("Propane")
        expect(page).to.not have_content("Propane")

        # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
      end
    end
  end
end
# https://developer.nrel.gov/api/alt-fuel-stations/v1.json?fuel_type=LPG,ELEC&postal_code=80203&limit=10
# "https://developer.nrel.gov/api/alt-fuel-stations/v1.json?postal_code=80203&limit=10&api_key='#{ENV[API_KEY]}'"

# https://developer.nrel.gov/api/alt-fuel-stations/v1.json?fuel_type=E85,ELEC&state=CA&limit=2


# As a user
# When I visit "/"
# And I fill in the search form with 80203
# And I click "Locate"
# Then I should be on page "/search" with parameters visible in the url
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
