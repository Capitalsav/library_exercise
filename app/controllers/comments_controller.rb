# frozen_string_literal: true

# Controller for user comments to image
class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: :create

  # GET /comments
  # GET /comments.json
  def index; end

  # GET /comments/1
  # GET /comments/1.json
  def show; end

  # GET /comments/new
  def new; end

  # GET /comments/1/edit
  def edit; end

  # POST /comments
  # POST /comments.json
  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.comments.new(book_id: @book.id,
                                             text: params[:comment][:text])
    respond_to do |format|
      if @comment.save
        format.html { redirect_back fallback_location: root_path }
        format.json { render json: @comment, status: :created }
      else
        format.html { redirect_back fallback_location: root_path }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update; end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy; end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
