class NewsFacade

    def self.search(input)
        service = NewsService.new
        json = service.search(input)
    
        news = []
        10.times do |i|
            if json[:articles][i] != nil
                news.append(ArticlePoro.new(json[:articles][i]))
            end
        end
        
        news
    end
end