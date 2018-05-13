require 'rails_helper'
RSpec.describe 'routes for Comments', type: :routing do
  it 'is able to create comments' do
    expect(post: '/books/1/comments').to route_to(controller: 'comments', action: 'create', book_id: '1')
  end

  it 'does not able to get comments index page' do
    expect(get: '/books/1/comments').not_to be_routable
  end

  it 'does not able to get one comments page' do
    expect(get: '/books/1/comments/1').not_to be_routable
  end

  it 'does not able to get new comments page' do
    expect(get: '/books/1/comments/new').not_to be_routable
  end

  it 'does not able to patch comments' do
    expect(patch: '/books/1/comments/1').not_to be_routable
  end

  it 'does not able to delete comments' do
    expect(delete: '/books/1/comments/1').not_to be_routable
  end
end