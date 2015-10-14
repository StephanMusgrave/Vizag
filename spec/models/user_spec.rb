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

end
