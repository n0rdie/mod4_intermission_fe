require "rails_helper"

RSpec.describe "News" do #, type: :feature do
    it "Index" do
        stub_request(:get, "https://newsapi.org/v2/everything?apiKey=#{Rails.application.credentials.news[:key]}&q=iterate.ai&sortBy=publishedAt").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.9.0'
           }).
        to_return(status: 200, body: File.read("spec/fixtures/iterate.json"), headers: {})

        visit '/news?q=iterate.ai&commit=Search'
        
        # titles
        expect(page).to have_link('What CIOs Should Consider When Exploring Generative AI')
        expect(page).to have_link('Software To Hardware: How To Shift To Building Physical Tech')
        expect(page).to have_link("Intel pousse ses Xeon pour faire de l'inférence auprès des entreprises")
        # description
        expect(page).to have_content("It's important for CIOs today to strategically address the impact of AI on the workforce.")
        # datetime
        expect(page).to have_content('2024-03-14T10:30:00Z')

        click_on('What CIOs Should Consider When Exploring Generative AI')

        expect(current_path).to eq('/news')
    end

    it "Show" do
        stub_request(:get, "https://newsapi.org/v2/everything?apiKey=#{Rails.application.credentials.news[:key]}&q=iterate.ai&sortBy=publishedAt").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.9.0'
           }).
        to_return(status: 200, body: File.read("spec/fixtures/iterate.json"), headers: {})

        visit '/news?q=iterate.ai&commit=Search&i=0'
        
        # title
        expect(page).to have_link('What CIOs Should Consider When Exploring Generative AI')        
        # source
        expect(page).to have_content('Forbes')
        # datetime
        expect(page).to have_content('2024-03-14T10:30:00Z')
        # content
        expect(page).to have_content('Chief Digital Officer at Iterate.ai')
    end
end