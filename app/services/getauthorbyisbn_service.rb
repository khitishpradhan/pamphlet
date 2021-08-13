class GetauthorbyisbnService < ApplicationService
  require "net/http"
  require "json"

  attr_reader :isbn

  def initialize(isbn)
    @isbn = isbn
  end

  def call
    url = url = "#{Rails.application.config.OpenLib_URL}api/books?bibkeys=ISBN:#{@isbn}&jscmd=details&format=json"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    author = JSON.parse(response)

    return false unless author
    author
  end
end
