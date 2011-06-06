require 'spec_helper'

describe Member do

  let(:member)        { Factory(:member) }
  let(:moderator)     { Factory(:moderator) }
  let(:administrator) { Factory(:administrator) }
  let(:topic)         { Factory(:topic) }

  subject { member }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it { should validate_format_of(:name).with('test') }
  it { should validate_format_of(:name).with('test_user') }
  it { should validate_format_of(:name).with('test_user2') }
  it { should validate_format_of(:name).not_with('test user').with_message(/is invalid/) }
  it { should validate_format_of(:name).not_with('test.user').with_message(/is invalid/) }
  it { should validate_format_of(:name).not_with('test!user').with_message(/is invalid/) }
  it { should validate_format_of(:name).not_with('test?user').with_message(/is invalid/) }
  it { should validate_format_of(:name).not_with('test+user').with_message(/is invalid/) }
  it { should validate_format_of(:name).not_with('test-user').with_message(/is invalid/) }
  it { should validate_format_of(:name).not_with('test/user').with_message(/is invalid/) }
  it { should validate_format_of(:name).not_with('test*user').with_message(/is invalid/) }

  it { should ensure_length_of(:name).is_at_least(1) }
  it { should ensure_length_of(:email).is_at_least(5) }

  it { should_not allow_mass_assignment_of(:id) }
  it { should_not allow_mass_assignment_of(:moderator) }
  it { should_not allow_mass_assignment_of(:administrator) }
  it { should_not allow_mass_assignment_of(:banned) }

  it { should validate_uniqueness_of(:name) }
  it { should validate_uniqueness_of(:email) }

  it 'should not save member whose password does not match password confirmation' do
    member = Factory.build :member, :password_confirmation => 'DOES NOT MATCH'
    member.save
    member.should_not be_persisted
  end

  it 'should return the correct topic count' do
    5.times do |n|
      member.posts.create :topic => topic,
                          :content => "Test Post ##{n}"
    end
    member.topic_count.should == 1
  end

  it 'should return the correct post count' do
    (post_count = 5).times do |n|
      member.posts.create :topic => topic,
                          :content => "Test Post ##{n}"
    end
    member.post_count.should == post_count
  end

end
