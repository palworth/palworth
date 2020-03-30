class FoodController < ApplicationController
    def index
      food = params[:q]
      food_collection = food.split(/ /)
      food_word_1 = food_collection[0]
      food_word_2 = food_collection[1]
    #   food_collection = food.gsub(" ", "20%")
        
      conn = Faraday.new(url: "https://api.nal.usda.gov") do |faraday|
         faraday.headers["api_key"] = ENV["FOOD_DATA_API_KEY"]
      end

        
      response = conn.get("/fdc/v1/search?api_key=#{ENV["FOOD_DATA_API_KEY"]}\&generalSearchInput=#{food_word_1}%20#{food_word_2}")

      json = JSON.parse(response.body, symbolize_names: true)
      @foods = json[:foods]
    end
end
