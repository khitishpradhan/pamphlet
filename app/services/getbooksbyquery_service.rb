class GetbooksbyqueryService < ApplicationService
  require "net/http"
  require "json"

  Base_URL = "http://openlibrary.org/"

  attr_reader :query

  def initialize(query)
    @query = query
  end

  def call
    url = "#{Base_URL}search.json?q=#{@query}&limit=12"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    books = JSON.parse(response)["docs"]

    return false unless books
    books
  end
end
