# frozen_string_literal: true

# Model of user comments to book
class Comment
  include Mongoid::Document
  field :text, type: String
  field :comment_time, type: DateTime
  belongs_to :book
  belongs_to :user
  validates :user_id, :book_id, :text, presence: true
end
