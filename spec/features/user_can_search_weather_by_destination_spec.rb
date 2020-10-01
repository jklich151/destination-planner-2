require 'rails_helper'

RSpec.describe "As a User" do
  it "I can see weather for a destination" do
    destination = Destination.create(name: "Denver",
                                    zip: "80220",
                                    description: "Great",
                                    image_url: "https://cache.marriott.com/marriottassets/destinations/hero/denver-destination.jpg?interpolation=progressive-bilinear")
    visit '/'

    within(".destination-#{destination.id}") do
      click_on "Show"
    end

    expect(current_path).to eq("/destinations/#{destination.id}")

    expect(page).to have_css(".name")
    expect(page).to have_css(".zipcode")
    expect(page).to have_css(".description")

    within(".forecast") do
      expect(page).to have_css(".date")
      expect(page).to have_css(".current_temp")
      expect(page).to have_css(".high_temp")
      expect(page).to have_css(".low_temp")
      expect(page).to have_css(".summary")
    end
  end

  it "can see an image related to the destination" do
    destination = Destination.create(name: "Denver",
                                    zip: "80220",
                                    description: "Great",
                                    image_url: "https://cache.marriott.com/marriottassets/destinations/hero/denver-destination.jpg?interpolation=progressive-bilinear")
    visit '/'

    within(".destination-#{destination.id}") do
      click_on "Show"
    end

    expect(current_path).to eq("/destinations/#{destination.id}")

    expect(page).to have_css('#image')
  end
end
