class BooksController < ApplicationController
    skip_before_action :authenticate_user!

    def index
        @books = Book.all
        @book = Book.new
    end

    def create
        puts params[:book]
        @book = Book.new(book_params)
        respond_to do |format|
            if @book.save
                format.js
                format.json { render json: @book, status: :created, location: @book }
            else
                format.json { render json: @book.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @book = Book.find(params[:id]).destroy
    end

    private
    def book_params
        params.require(:book).permit(:name)
    end
end
