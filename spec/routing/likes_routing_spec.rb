require 'rails_helper'
RSpec.describe 'routes for Likes', type: :routing do
  it 'is able to create like' do
    expect(post: 'books/1/likes').to route_to(controller: 'likes', action: 'create', book_id: '1')
  end

  it 'is able to update like' do
    expect(patch: 'books/1/likes/1').to route_to(controller: 'likes', action: 'update', book_id: '1', id: '1')
  end

  it 'does not able to get likes index page' do
    expect(get: '/books/1/likes').not_to be_routable
  end

  it 'does not able to get one like page' do
    expect(get: '/books/1/likes/1').not_to be_routable
  end

  it 'does not able to get new likes page' do
    expect(get: '/books/1/likes/new').not_to be_routable
  end

  it 'does not able to delete like' do
    expect(delete: '/books/1/likes/1').not_to be_routable
  end
end