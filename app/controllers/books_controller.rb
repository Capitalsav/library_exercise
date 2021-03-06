# frozen_string_literal: true

# Controller for library books
class BooksController < ApplicationController
  before_action :set_book, only: :show
  before_action :set_top_books, only: :index

  # GET /books
  # GET /books.json
  def index
    @books = Kaminari.paginate_array(Book.all).page(params[:page])
    json_response = { "books": @books, "top_books": @top_books }
    respond_to do |format|
      format.html
      format.js {}
      format.json { render json: json_response, status: :ok }
    end
  end
  # GET /books/1
  # GET /books/1.json
  def show
    @history = History.new
    respond_to do |format|
      format.html
      format.json { render json: @book, status: :ok }
    end
  end

  # GET /books/new
  def new; end

  # GET /books/1/edit
  def edit; end

  # POST /books
  # POST /books.json
  def create; end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update; end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy; end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :author, :description, :status)
  end

  def set_top_books
    @top_books = Book.all.order_by(likes_count: :desc, histories_count: :desc).limit(5).to_a
  end
end
