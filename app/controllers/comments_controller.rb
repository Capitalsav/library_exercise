class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

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
    @comment = current_user.comments.create!(book_id: @book.id,
                                  text: params[:comment][:text],
                                  comment_time: DateTime.now)
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

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:text)
  end
end
