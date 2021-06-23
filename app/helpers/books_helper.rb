module BooksHelper
  require "net/http"
  require "json"

  def fetch
    @url = "https://openlibrary.org/works/OL82563W.json"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
  end

  def search_books_suggestion(q)
    @url = "http://openlibrary.org/search.json?author=#{q}"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
  end
end
