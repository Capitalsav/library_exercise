require 'rails_helper'

RSpec.describe Like, type: :model do
  it { is_expected.to be_mongoid_document }

  it { is_expected.to have_field(:rate).of_type(Integer) }

  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:book_id) }

  it { is_expected.to belong_to(:book) }
  it { is_expected.to belong_to(:user) }
end
