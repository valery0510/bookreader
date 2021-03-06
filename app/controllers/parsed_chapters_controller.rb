class ParsedChaptersController < ApplicationController
  def show
    @book = Book.find(params[:book_id])
    @parsed_chapter = @book.parsed_chapters.find(params[:id])
  end

  def translate
    @book = Book.find(params[:book_id])
    @parsed_chapter = @book.parsed_chapters.find(params[:id])
    @parsed_chapter.delay.translate!

    redirect_to @book
  end

  def read
    @book = Book.find(params[:book_id])
    @chapter = @book.parsed_chapters.find(params[:id])
  end
end
