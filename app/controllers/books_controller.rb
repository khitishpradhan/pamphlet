class BooksController < ApplicationController
  
  require 'net/http'
  require 'json'

  def search
    @query = params[:query]
    @url = "http://openlibrary.org/search.json?q=#{@query}&limit=10"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
    @books = @output['docs']
    # @pretty = JSON.pretty_generate(@books)
    # render plain: @pretty
  end

  def show 
    @id = params[:id]
    @isbn = params[:isbn]
    @author_url = "https://openlibrary.org/api/books?bibkeys=ISBN:#{@isbn}&jscmd=details&format=json" 
    @url = "https://openlibrary.org/works/#{@id}.json"
    @uri = URI(@url)
    @author_uri = URI(@author_url)
    @author_response = Net::HTTP.get(@author_uri) 
    @response = Net::HTTP.get(@uri)
    @book = JSON.parse(@response)
    @author = JSON.parse(@author_response)["ISBN:#{@isbn}"]['details']['authors'][0]['name']
  end


end
