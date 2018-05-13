require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to be_mongoid_document }

  it { is_expected.to have_field(:email).of_type(String) }
  it { is_expected.to have_field(:encrypted_password).of_type(String) }
  it { is_expected.to have_field(:reset_password_token).of_type(String) }
  it { is_expected.to have_field(:reset_password_sent_at).of_type(Time) }
  it { is_expected.to have_field(:remember_created_at).of_type(Time) }


  it { is_expected.to have_field(:sign_in_count).of_type(Integer) }
  it { is_expected.to have_field(:current_sign_in_at).of_type(Time) }
  it { is_expected.to have_field(:last_sign_in_at).of_type(Time) }
  it { is_expected.to have_field(:current_sign_in_ip).of_type(String) }
  it { is_expected.to have_field(:last_sign_in_ip).of_type(String) }



  it { is_expected.to have_field(:confirmation_token).of_type(String) }
  it { is_expected.to have_field(:confirmed_at).of_type(Time) }
  it { is_expected.to have_field(:confirmation_sent_at).of_type(Time) }
  it { is_expected.to have_field(:unconfirmed_email).of_type(String) }
  it { is_expected.to have_field(:name).of_type(String) }
  it { is_expected.to have_field(:avatar).of_type(String) }




  it { is_expected.to have_many(:histories).with_dependent(:destroy) }
  it { is_expected.to have_many(:likes).with_dependent(:destroy) }
  it { is_expected.to have_many(:comments).with_dependent(:destroy) }

  describe '#email' do
    it 'should validate presence' do
      record = User.new
      record.email = '' # invalid state
      record.valid? # run validations
      expect(record.errors[:email]).to include('can\'t be blank')
      record.email = 'test@test.com' # valid state
      record.valid? # run validations
      expect(record.errors[:email]).not_to include('can\'t be blank')
    end
  end

  describe '#password' do
    it 'should validate presence' do
      record = User.new
      record.email = 'test@test.com' # invalid state
      record.encrypted_password = ''
      record.valid? # run validations
      expect(record.errors[:encrypted_password]).to include('can\'t be blank')
      record.email = 'test@test.com' # valid state
      record.encrypted_password = '123456'
      record.valid? # run validations
      expect(record.errors[:encrypted_password])
          .not_to include('can\'t be blank')
    end

    it 'should validate length' do
      record = User.new
      record.email = 'test@test.com' # invalid state
      record.encrypted_password = '1234'
      record.valid? # run validations
      expect(record.errors[:encrypted_password])
          .to include('is too short (minimum is 6 characters)')
      record.email = 'test@test.com' # valid state
      record.encrypted_password = '123456'
      record.valid? # run validations
      expect(record.errors[:encrypted_password])
          .not_to include('is too short (minimum is 6 characters)')
    end
  end
end
