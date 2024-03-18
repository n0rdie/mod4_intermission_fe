class NewsController < ApplicationController
    def index
        @input = params[:q]
		@news = NewsFacade.search(@input)
    end
end