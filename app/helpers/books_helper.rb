module BooksHelper
    def fetch
        require 'net/http'
        require 'json'
        
        @url = 'https://openlibrary.org/works/OL82563W.json'
        @uri = URI(@url)
        @response = Net::HTTP.get(@uri)
        @output = JSON.parse(@response)
    
    end



end
