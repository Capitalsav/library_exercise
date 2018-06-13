# frozen_string_literal: true

# Model book for library
class Book
  include Mongoid::Document
  field :name, type: String
  field :author, type: String
  field :description, type: String
  field :status, type: String
  field :image, type: String

  has_many :histories, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, :author, :description, :status, :image, presence: true

  def ordered_histories
    histories.order(taken_in: :desc)
  end

  def book_rating
    rating_array = likes.map { |like| like.rate.to_i }
    return 0 if rating_array.empty?
    (rating_array.sum / rating_array.size).round
  end
end
