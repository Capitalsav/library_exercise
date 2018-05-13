require 'rails_helper'
RSpec.describe 'routes for Histories', type: :routing do
  it do
    expect(post: 'books/1/histories').to route_to(controller: 'histories', action: 'create', book_id: '1')
  end

  it do
    expect(patch: 'books/1/histories/1').to route_to(controller: 'histories', action: 'update', book_id: '1', id: '1')
  end

  it 'does not able to get histories index page' do
    expect(get: '/books/1/histories').not_to be_routable
  end

  it 'does not able to get one history page' do
    expect(get: '/books/1/histories/1').not_to be_routable
  end

  it 'does not able to get new histories page' do
    expect(get: '/books/1/histories/new').not_to be_routable
  end

  it 'does not able to delete histories' do
    expect(delete: '/books/1/histories/1').not_to be_routable
  end
end