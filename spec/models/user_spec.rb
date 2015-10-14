#  spec/models/user.rb
#
# Author::   Steve Musgrave  (mailto:stephan.musgrave@gmail.com)

require 'rails_helper'

describe User do
  subject { build :fake_user }

  it 'has a valid factory' do
    expect(subject).to be_valid
  end

  it 'is invalid without a first_name' do
    expect(build(:fake_user, first_name: nil)).to_not be_valid
  end

  it 'can be valid without a last_name' do
    expect(build(:fake_user, last_name: nil)).to be_valid
  end

  it 'is invalid without an email address' do
    expect(build(:fake_user, email: nil)).to_not be_valid
  end

  it 'is invalid with an incorrectly formed email address' do
    expect(build(:fake_user, email: 'steve.steve.com')).to_not be_valid
  end

  it 'has a full name constructed from the first and last name' do
    user = build(:fake_user, first_name: 'Ratna', last_name: 'Musgrave')
    expect(user.full_name).to eq 'Ratna Musgrave'
  end

  it 'can have a full name constructed from only the first name if the last name is not present' do
    user = build(:fake_user, first_name: 'Nick', last_name: nil)
    expect(user.full_name).to eq 'Nick'
  end

  it 'does not have manager status if the user is a customer' do
    customer1 = build(:customer)
    expect(customer1.has_manager).to be false
  end

  it 'has manager status if the user is a manager' do
    supervisor = build(:manager)
    expect(supervisor.has_manager).to be true
  end

end
