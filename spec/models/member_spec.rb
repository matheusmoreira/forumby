require 'spec_helper'

describe Member do

  subject { Factory(:member) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it { should ensure_length_of(:name).is_at_least(1) }
  it { should ensure_length_of(:email).is_at_least(5) }

  it { should_not allow_mass_assignment_of(:id) }
  it { should_not allow_mass_assignment_of(:moderator) }
  it { should_not allow_mass_assignment_of(:administrator) }
  it { should_not allow_mass_assignment_of(:banned) }

  it { should validate_uniqueness_of(:name) }
  it { should validate_uniqueness_of(:email) }

  it 'should save member with factory parameters' do
    member = Factory.build :member
    member.save
    member.should be_persisted
  end

  it 'should not save member whose password does not match password confirmation' do
    member = Factory.build :member, :password_confirmation => 'DOES NOT MATCH'
    member.save
    member.should_not be_persisted
  end

end
