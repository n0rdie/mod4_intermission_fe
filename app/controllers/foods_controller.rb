class FoodsController < ApplicationController
    def index
		conn = Faraday.new('https://api.nal.usda.gov') do |faraday|
			faraday.params["api_key"] = Rails.application.credentials.api[:key]
		end
        response = conn.get('/fdc/v1/foods/search') do |request|
        	request.params['query'] = params[:q]
      	end

        @hash = JSON.parse(response.body, symbolize_names: true)
    end
end