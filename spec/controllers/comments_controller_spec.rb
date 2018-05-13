require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before(:each) do
    @user = create(:user)
    sign_in @user
    @book = create(:book)
  end

  describe 'POST #create' do
    it 'creates comment' do
      expect do
        post :create, params: {
            comment: attributes_for(:comment, book_id: @book.id, text: 'Text'),
            book_id: @book.id
        }
      end.to change { Comment.count }.by(1) and
          have_http_status(200)
    end
  end
end
