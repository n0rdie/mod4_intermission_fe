class ArticlePoro
    attr_reader :headline,
                :image,
                :description,
                :datetime,
                :content,
                :source,
                :link
  
    def initialize(data)
        @id = nil
        @headline = data[:title]
        @image = data[:urlToImage]
        @description = data[:description]
        @datetime = data[:publishedAt]
        @content = data[:content]
        @source = data[:source][:name]
        @link = data[:url]
    end
end