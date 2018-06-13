require 'rails_helper'
RSpec.describe 'routes for Books', type: :routing do
  it 'is able to get books index page' do
    expect(get: '/books').to route_to(controller: 'books', action: 'index')
  end

  it 'is able to get one book page' do
    expect(get: '/books/1').to route_to(controller: 'books', action: 'show', id: '1')
  end

  it 'does not able to create books' do
    expect(post: '/books').not_to be_routable
  end

  it 'does not able to patch books' do
    expect(patch: '/books/1').not_to be_routable
  end

  it 'does not able to delete books' do
    expect(delete: '/books/1').not_to be_routable
  end
end