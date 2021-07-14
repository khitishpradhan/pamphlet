class GetbooksbyauthorService < ApplicationService
  require "net/http"
  require "json"

  attr_reader :author

  def initialize(author)
    @author = author
  end

  def call
    url = url = "#{Rails.application.config.OpenLib_URL}search.json?author=#{@author}&limit=3"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    books = JSON.parse(response)["docs"]

    return false unless books
    books
  end
end
