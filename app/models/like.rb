class Like
  include Mongoid::Document
  field :rate, type: Integer
  belongs_to :book
  belongs_to :user
end
