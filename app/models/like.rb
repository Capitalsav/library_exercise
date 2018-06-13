# frozen_string_literal: true

# Model of user likes to book
class Like
  include Mongoid::Document
  field :rate, type: Integer
  belongs_to :book, counter_cache: :likes_count
  belongs_to :user
  validates :user_id, :book_id, presence: true
end
