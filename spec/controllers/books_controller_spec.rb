require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  before(:each) do
    @user = create(:user)
    sign_in @user
  end

  describe 'GET #index' do
    it 'render index template' do
      get :index
      expect(response).to render_template('index')
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #show' do
    it 'assigns @book' do
      book = create(:book)
      get(:show, params: { id: book.id })
      expect(assigns(:book)).to eq(book)
    end

    it 'render show template' do
      book = create(:book)
      get(:show, params: { id: book.id })
      expect(response).to render_template('show')
      expect(response).to have_http_status(200)
    end
  end
end

