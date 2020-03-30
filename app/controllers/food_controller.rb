class FoodController < ApplicationController
    def index
      food = params[:q]
      food_collection = food.split(/ /)
      food_word_1 = food_collection[0]
      food_word_2 = food_collection[1]
        
      conn = Faraday.new(url: "https://api.nal.usda.gov") do |faraday|
         faraday.headers["api_key"] = 'xvfkfIcQZo29ZuBs2BFPSkibeYZGKcaUeg6pZYk2'
      end

        
      response = conn.get("/fdc/v1/search?api_key=xvfkfIcQZo29ZuBs2BFPSkibeYZGKcaUeg6pZYk2\&generalSearchInput=#{food_word_1}%20#{food_word_2}")

      json = JSON.parse(response.body, symbolize_names: true)
      @foods = json[:foods]
    end
end
