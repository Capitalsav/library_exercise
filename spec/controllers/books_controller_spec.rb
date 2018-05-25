require 'rails_helper'


RSpec.describe BooksController, type: :controller do
  let(:json) { JSON.parse(response.body) }
  before(:each) do
    @user = create(:user)
    sign_in @user
  end

  describe 'GET #index' do
    it 'assigns @books' do
      book = create(:book)
      get :index
      expect(assigns(:books)).to eq([book])
    end

    it 'render index template' do
      get :index
      expect(response).to render_template('index')
      expect(response).to have_http_status(200)
    end

    it 'return books in JSON' do
      book = create(:book)
      get :index, format: :json
      expect(json["books"].collect{|b| b["name"]}).to include(book.name)
    end

    it 'responds books JSON with 200' do
      get :index, format: :json
      expect(response.status).to eq(200)
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

    it 'return book in JSON' do
      book = create(:book)
      get(:show, params: { id: book.id }, format: :json)
      expect(json["name"]).to include(book.name)
    end

    it 'responds book JSON with 200' do
      book = create(:book)
      get(:show, params: { id: book.id }, format: :json)
      expect(response.status).to eq(200)
    end
  end
end

