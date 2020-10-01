require 'rails_helper'

RSpec.describe "Api V1 Weather", type: :request do
  it "can see weather info for a destination" do
    get '/api/v1/weather?location=Denver'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:attributes]).not_to be_empty
    expect(json[:data][:attributes][:id]).to be_a(Integer)
    expect(json[:data][:attributes][:current_temp]).to be_a(Float)
    expect(json[:data][:attributes][:date]).not_to be_empty
    expect(json[:data][:attributes][:high_temp]).to be_a(Float)
    expect(json[:data][:attributes][:low_temp]).to be_a(Float)
    expect(json[:data][:attributes][:summary]).not_to be_empty
    expect(json[:data][:attributes][:image]).not_to be_empty
  end
end
