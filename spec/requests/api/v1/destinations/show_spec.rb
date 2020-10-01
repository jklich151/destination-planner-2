require 'rails_helper'

RSpec.describe "Api V1 Destinations Show", type: :request do
  xit "can see destination info" do
    destination = Destination.create(name: "Denver",
                                    zip: "80220",
                                    description: "Great",
                                    image_url: "https://cache.marriott.com/marriottassets/destinations/hero/denver-destination.jpg?interpolation=progressive-bilinear")

    get "/api/v1/destinations/#{destination.id}"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:attributes]).not_to be_empty
  end
end
