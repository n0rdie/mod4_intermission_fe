class NewsController < ApplicationController
    def index
        @input = params[:input]
		@news = NewsFacade.search(params[:input])
    end
end