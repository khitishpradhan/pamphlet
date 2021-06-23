class BooksController < ApplicationController
  require "net/http"
  require "json"

  def search
    @query = params[:query]
    @url = "http://openlibrary.org/search.json?q=#{@query}&limit=10"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
    @books = @output["docs"]
  end

  def show
    @id = params[:id]

    @review = Review.new

    @isbn = params[:isbn]
    @author_url = "https://openlibrary.org/api/books?bibkeys=ISBN:#{@isbn}&jscmd=details&format=json"
    @url = "https://openlibrary.org/works/#{@id}.json"
    @uri = URI(@url)
    @author_uri = URI(@author_url)
    @author_response = Net::HTTP.get(@author_uri)
    @response = Net::HTTP.get(@uri)
    @book = JSON.parse(@response)
    @author = JSON.parse(@author_response)["ISBN:#{@isbn}"]["details"]["authors"][0]["name"]
    @preview = JSON.parse(@author_response)["ISBN:#{@isbn}"]["preview_url"]

    @reviews = Review.all

    @suggestion_url = "http://openlibrary.org/search.json?author=#{@author}&limit=2"
    @suggestion_uri = URI(@suggestion_url)
    @suggestion_response = Net::HTTP.get(@suggestion_uri)
    @suggestions = JSON.parse(@suggestion_response)["docs"]
  end
end
