class NewsService
    def conn
        Faraday.new(url: 'https://newsapi.org') do |faraday|
            #faraday.headers['X-Api-Key'] = Rails.application.credentials.api_ninjas[:key]
        end
    end
    
    def get_url(url)
        response = conn.get(url) 
        
        JSON.parse(response.body, symbolize_names: true)
    end
    
    def search(input)
        get_url("/v2/everything?q=#{input}&sortBy=publishedAt&apiKey=#{Rails.application.credentials.news[:key]}")
    end
end