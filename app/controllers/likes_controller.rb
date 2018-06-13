# frozen_string_literal: true

# Controller for user likes to image
class LikesController < ApplicationController
  before_action :set_like, only: :update
  before_action :authenticate_user!, only: %i[create update]

  # GET /likes
  # GET /likes.json
  def index; end

  # GET /likes/1
  # GET /likes/1.json
  def show; end

  # GET /likes/new
  def new; end

  # GET /likes/1/edit
  def edit; end

  # POST /likes
  # POST /likes.json
  def create
    @book = Book.find(params[:book_id])
    @like = current_user.likes.new(book_id: @book.id,
                                       rate: params[:like][:rate])
    respond_to do |format|
      if @like.save
        format.html { redirect_back fallback_location: root_path }
        format.json { render json: @like, status: :created }
      else
        format.html { redirect_back fallback_location: root_path }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /likes/1
  # PATCH/PUT /likes/1.json
  def update
    respond_to do |format|
      if @like.update(like_params)
        format.html { redirect_back fallback_location: root_path }
        format.json { render json: @like, status: :ok }
      else
        format.html { redirect_back fallback_location: root_path }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy; end

  private

  def set_like
    @like = Like.find(params[:id])
  end

  def like_params
    params.require(:like).permit(:rate)
  end
end
