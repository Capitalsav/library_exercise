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

  def ordered_histories
    self.histories.order(taken_in: :desc)
  end
end
