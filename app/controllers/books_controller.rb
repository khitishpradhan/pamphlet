class BooksController < ApplicationController
  require "net/http"
  require "json"

  def search
    @query = params[:query]
    @url = "http://openlibrary.org/search.json?q=#{@query}&limit=12"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
    @books = @output["docs"]
  end

  def show
    @id = params[:id]

    @review = Review.new

    @url = "https://openlibrary.org/works/#{@id}.json"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @book = JSON.parse(@response)

    @isbn = params[:isbn]
    @author_url = "https://openlibrary.org/api/books?bibkeys=ISBN:#{@isbn}&jscmd=details&format=json"
    @author_uri = URI(@author_url)
    @author_response = Net::HTTP.get(@author_uri)

    @author_json = JSON.parse(@author_response)["ISBN:#{@isbn}"]["details"]["authors"]

    if (@author_json == nil)
      @suggestions = []
      @author = []
    else
      @author = @author_json[0]["name"]
      @suggestion_url = "http://openlibrary.org/search.json?author=#{@author}&limit=3"
      @suggestion_uri = URI(@suggestion_url)
      @suggestion_response = Net::HTTP.get(@suggestion_uri)
      @suggestions = JSON.parse(@suggestion_response)["docs"]
    end
    @preview = JSON.parse(@author_response)["ISBN:#{@isbn}"]["preview_url"]
    @reviews = Review.where(book_id: "#{@id}")
  end
end
