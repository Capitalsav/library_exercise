# frozen_string_literal: true

# Controller for histories
class HistoriesController < ApplicationController
  before_action :set_history, only: :update
  after_action :take_book, only: :create
  after_action :return_book, only: :update

  # GET /histories
  # GET /histories.json
  def index; end

  # GET /histories/1
  # GET /histories/1.json
  def show; end

  # GET /histories/new
  def new; end

  # GET /histories/1/edit
  def edit; end

  # POST /histories
  # POST /histories.json
  def create
    @history = History.new(history_params)
    @history.taken_in = DateTime.now
    respond_to do |format|
      if @history.save
        format.html { redirect_back fallback_location: root_path }
        format.json { render json: @history, status: :created }
      else
        format.html { redirect_back fallback_location: root_path }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /histories/1
  # PATCH/PUT /histories/1.json
  def update
    respond_to do |format|
      if @history.update(returned_in: DateTime.now)
        format.html { redirect_back fallback_location: root_path }
        format.json { render json: @history, status: :ok }
      else
        format.html { redirect_back fallback_location: root_path }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /histories/1
  # DELETE /histories/1.json
  def destroy; end

  private

  def set_history
    @history = History.find(params[:id])
  end

  def history_params
    params.require(:history).permit(:user_id, :book_id)
  end

  def take_book
    Book.find(params[:book_id]).update(status: 'Out') if
      Book.find(params[:book_id])&.histories&.last&.taken_in.present?
  end

  def return_book
    Book.find(params[:book_id]).update(status: 'In') if
      Book.find(params[:book_id])&.histories&.last&.returned_in.present?
  end
end
