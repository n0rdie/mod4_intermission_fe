require 'rails_helper'

RSpec.describe 'News Facade' do 
    it '#get news search' do
        stub_request(:get, "https://newsapi.org/v2/everything?q=iterate.ai&sortBy=publishedAt&apiKey=#{Rails.application.credentials.news[:key]}").
            with(
                headers: {
                    'Accept'=>'*/*',
                    'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                    'User-Agent'=>'Faraday v2.9.0'
        }).
        to_return(status: 200, body: File.read("spec/fixtures/iterate.json"), headers: {})

        news = NewsFacade.search('iterate.ai')

        expect(news.count).to eq(3)
        expect(news[0].headline).to eq('What CIOs Should Consider When Exploring Generative AI')
        expect(news[0].image).to eq('https://imageio.forbes.com/specials-images/imageserve/640f2ca26c680dae90216405/0x0.jpg?format=jpg&height=900&width=1600&fit=bounds')
        expect(news[0].description).to eq("It's important for CIOs today to strategically address the impact of AI on the workforce.")
        expect(news[0].datetime).to eq('2024-03-14T10:30:00Z')
        expect(news[0].source).to eq('Forbes')
        expect(news[0].link).to eq('https://www.forbes.com/sites/forbestechcouncil/2024/03/14/what-cios-should-consider-when-exploring-generative-ai/')
    end
end