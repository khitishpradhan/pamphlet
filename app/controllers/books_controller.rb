class BooksController < ApplicationController
  def search
    @query = params[:query]
    @books = GetbooksbyqueryService.call(params[:query])
  end

  def show
    id = params[:id]

    @review = Review.new
    @book = GetbookbyidService.call(params[:id])

    isbn = params[:isbn]
    author_response = GetauthorbyisbnService.call(params[:isbn])
    author_json = author_response["ISBN:#{isbn}"]["details"]["authors"]

    if (author_json == nil)
      @suggestions = nil
      @author = nil
    else
      @author = author_json[0]["name"]
      @suggestions = GetbooksbyauthorService.call(@author)
    end
    @preview = author_response["ISBN:#{isbn}"]["preview_url"]
    @reviews = Review.where(book_id: id)
  end
end
