require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  before(:each) do
    @user = create(:user)
    sign_in @user
    @book = create(:book)
  end

  describe 'POST #create' do
    it 'creates history' do
      expect do
        post :create, params: {
            like: attributes_for(:like, user_id: @user.id, book_id: @book.id, rate: 5),
            book_id: @book.id
        }
      end.to change { Like.count }.by(1) and
          have_http_status(200)
    end
  end

  describe 'PATCH #update' do
    before(:each) do
      @like = Like.create(book_id: @book.id, user_id: @user.id, rate: 5)
    end
    it 'update history' do
      patch :update,
            params: { id: @like.id,
                      like: { rate: 3 },
                      book_id: @book.id,
                      user_id: @user.id }
      expect(response).to have_http_status(302)
    end
  end
end
