class GetbooksbyqueryService < ApplicationService
  require "net/http"
  require "json"

  attr_reader :query

  def initialize(query)
    @query = query
  end

  def call
    url = "#{Rails.application.config.OpenLib_URL}search.json?q=#{@query}&limit=12"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    books = JSON.parse(response)["docs"]

    return false unless books
    books
  end
end
