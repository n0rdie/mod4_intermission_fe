class NewsController < ApplicationController
    def index
        @input = params[:q]
		@news = NewsFacade.search(@input)

        if params[:i]
            @i = params[:i].to_i
        end
    end
end