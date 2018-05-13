require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  it { is_expected.to have_field(:text).of_type(String) }

  it { is_expected.to belong_to(:book) }
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:book_id) }
  it { is_expected.to validate_presence_of(:text) }

  describe '#text' do
    it 'should validate presence' do
      record = Comment.new
      record.text = '' # invalid state
      record.valid? # run validations
      expect(record.errors[:text]).to include('can\'t be blank')
      record.text = 'Text' # valid state
      record.valid? # run validations
      expect(record.errors[:text]).not_to include('can\'t be blank')
    end
  end
end

