class FoodController < ApplicationController
    def index
        food = params[:q]
        
        conn = Faraday.new(url: "https://api.nal.usda.gov") do |faraday|
            faraday.headers["api_key"] = 'xvfkfIcQZo29ZuBs2BFPSkibeYZGKcaUeg6pZYk2'
            binding.pry
    end

    response = conn.get("/congress/v1/members/house/#{state}/current.json")

    json = JSON.parse(response.body, symbolize_names: true)
    @foods = json[:results]
    end
end
