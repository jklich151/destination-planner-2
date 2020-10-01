class ImageService

  def conn
    Faraday.new(url: "https://api.giphy.com") do |faraday|
      faraday.params["api_key"] = ENV["IMAGE_KEY"]
    end
  end

  def get_image_url(summary)
    response = conn.get("/v1/gifs/search?q=#{summary}")
    parsed_json(response)
  end

  def parsed_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
