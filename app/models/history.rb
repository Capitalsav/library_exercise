# frozen_string_literal: true

# Model history for library books
class History
  include Mongoid::Document
  field :taken_in, type: DateTime
  field :returned_in, type: DateTime
  belongs_to :book, counter_cache: :histories_count
  belongs_to :user

  validates :taken_in, presence: true
end
