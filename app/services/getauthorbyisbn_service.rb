class GetauthorbyisbnService < ApplicationService
  require "net/http"
  require "json"

  Base_URL = "http://openlibrary.org/"

  attr_reader :isbn

  def initialize(isbn)
    @isbn = isbn
  end

  def call
    url = url = "#{Base_URL}api/books?bibkeys=ISBN:#{@isbn}&jscmd=details&format=json"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    author = JSON.parse(response)

    return false unless author
    author
  end
end
