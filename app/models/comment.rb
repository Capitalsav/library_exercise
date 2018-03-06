class Comment
  include Mongoid::Document
  field :text, type: String
  belongs_to :book
  belongs_to :user
end
