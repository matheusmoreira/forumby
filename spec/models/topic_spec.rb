require 'spec_helper'

describe Topic do

  let(:topic) { Factory(:topic) }
  let(:post) { Factory(:post) }

  subject { topic }

  it { should have_many(:posts) }

  it { should belong_to(:forum) }

  it { should validate_presence_of(:forum) }
  it { should validate_presence_of(:title) }

  it { should ensure_length_of(:title).is_at_least(1).is_at_most(80) }

  it { should_not allow_mass_assignment_of(:id) }

  it 'should return the first post' do
    topic.stub!(:posts).and_return [ post ]
    topic.first_post.should == post
  end

end
