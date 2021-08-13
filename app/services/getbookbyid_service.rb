class GetbookbyidService < ApplicationService
  require "net/http"
  require "json"

  attr_reader :id

  def initialize(id)
    @id = id
  end

  def call
    url = url = "#{Rails.application.config.OpenLib_URL}works/#{@id}.json"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    book = JSON.parse(response)

    return false unless book
    book
  end
end
