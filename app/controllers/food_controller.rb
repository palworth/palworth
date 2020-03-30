class FoodController < ApplicationController
    def index
      food = params[:q]
      food_collection = food.gsub(" ","20%")        
      conn = Faraday.new(url: "https://api.nal.usda.gov") do |faraday|
         faraday.headers["api_key"] = ENV["FOOD_DATA_API_KEY"]
      end

        
      response = conn.get("/fdc/v1/search?api_key=#{ENV["FOOD_DATA_API_KEY"]}\&generalSearchInput=#{food_collection}")

      json = JSON.parse(response.body, symbolize_names: true)
      @foods = json[:foods]
    end
end
