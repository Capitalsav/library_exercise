require 'rails_helper'

RSpec.describe HistoriesController, type: :controller do
  let(:json) { JSON.parse(response.body) }
  before(:each) do
    @user = create(:user)
    sign_in @user
    @book = create(:book)
  end

  describe 'POST #create' do
    it 'creates history' do
      expect do
        post :create, params: {
            history: attributes_for(:history, user_id: @user.id, book_id: @book.id),
            book_id: @book.id
        }
      end.to change { History.count }.by(1) and
          have_http_status(200)
    end

    it 'creates history with JSON' do
      expect do
        post :create, params: {
            history: attributes_for(:history, user_id: @user.id, book_id: @book.id),
            book_id: @book.id
        },
             format: :json
      end.to change { History.count }.by(1) and
          have_http_status(200)
    end
  end

  describe 'PATCH #update' do
    before(:each) do
      @history = History.create(book_id: @book.id, taken_in: DateTime.now, user_id: @user.id )
    end
    it 'update history' do
        patch :update,
              params: { id: @history.id,
                        history: { returned_in: DateTime.now },
                        book_id: @book.id,
                        user_id: @user.id }
        expect(response).to have_http_status(302)
    end
    it 'update history with JSON' do
      patch :update,
            params: { id: @history.id,
                      history: { returned_in: DateTime.now },
                      book_id: @book.id,
                      user_id: @user.id },
            format: :json
      expect(response).to have_http_status(200)
    end
  end
end
