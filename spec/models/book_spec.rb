require 'rails_helper'

RSpec.describe Book, type: :model do
  it { is_expected.to be_mongoid_document }

  it { is_expected.to have_field(:name).of_type(String) }
  it { is_expected.to have_field(:author).of_type(String) }
  it { is_expected.to have_field(:description).of_type(String) }
  it { is_expected.to have_field(:status).of_type(String) }
  it { is_expected.to have_field(:image).of_type(String) }

  it { is_expected.to have_many(:histories).with_dependent(:destroy) }
  it { is_expected.to have_many(:likes).with_dependent(:destroy) }
  it { is_expected.to have_many(:comments).with_dependent(:destroy) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to validate_presence_of(:image) }

  describe '#name' do
    it 'should validate presence' do
      record = Book.new
      record.name = '' # invalid state
      record.valid? # run validations
      expect(record.errors[:name]).to include('can\'t be blank')
      record.name = 'Book1' # valid state
      record.valid? # run validations
      expect(record.errors[:name]).not_to include('can\'t be blank')
    end
  end

  describe '#author' do
    it 'should validate presence' do
      record = Book.new
      record.author = '' # invalid state
      record.valid? # run validations
      expect(record.errors[:author]).to include('can\'t be blank')
      record.author = 'Author1' # valid state
      record.valid? # run validations
      expect(record.errors[:author]).not_to include('can\'t be blank')
    end
  end

  describe '#description' do
    it 'should validate presence' do
      record = Book.new
      record.description = '' # invalid state
      record.valid? # run validations
      expect(record.errors[:description]).to include('can\'t be blank')
      record.description = 'Description1' # valid state
      record.valid? # run validations
      expect(record.errors[:description]).not_to include('can\'t be blank')
    end
  end

  describe '#status' do
    it 'should validate presence' do
      record = Book.new
      record.status = '' # invalid state
      record.valid? # run validations
      expect(record.errors[:status]).to include('can\'t be blank')
      record.status = 'Status1' # valid state
      record.valid? # run validations
      expect(record.errors[:status]).not_to include('can\'t be blank')
    end
  end

  describe '#image' do
    it 'should validate presence' do
      record = Book.new
      record.image = '' # invalid state
      record.valid? # run validations
      expect(record.errors[:image]).to include('can\'t be blank')
      record.image = 'Image1' # valid state
      record.valid? # run validations
      expect(record.errors[:image]).not_to include('can\'t be blank')
    end
  end
end
