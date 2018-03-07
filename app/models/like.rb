# frozen_string_literal: true

# Model of user likes to book
class Like
  include Mongoid::Document
  field :rate, type: Integer
  belongs_to :book
  belongs_to :user
end
