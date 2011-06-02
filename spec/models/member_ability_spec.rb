require 'spec_helper'
require 'cancan/matchers'

describe MemberAbility do

  let(:member)                { Factory(:member) }
  let(:moderator)             { Factory(:moderator) }
  let(:administrator)         { Factory(:administrator) }
  let(:banned_member)         { Factory(:banned_member) }
  let(:banned_moderator)      { Factory(:banned_moderator) }
  let(:banned_administrator)  { Factory(:banned_administrator) }
  let(:members)               { ability_for :member }
  let(:moderators)            { ability_for :moderator }
  let(:administrators)        { ability_for :administrator }
  let(:banned_members)        { ability_for :banned_member }
  let(:banned_moderators)     { ability_for :banned_moderator }
  let(:banned_administrators) { ability_for :banned_administrator }

  # Members

  it 'should allow members to read categories' do
    members.should be_able_to :read, Category
  end

  it 'should not allow members to create categories' do
    members.should_not be_able_to :create, Category
  end

  it 'should not allow members to edit categories' do
    members.should_not be_able_to :update, Category
  end

  it 'should not allow members to delete categories' do
    members.should_not be_able_to :destroy, Category
  end

  it 'should allow members to read forums' do
    members.should be_able_to :read, Forum
  end

  it 'should not allow members to create forums' do
    members.should_not be_able_to :create, Forum
  end

  it 'should not allow members to edit forums' do
    members.should_not be_able_to :update, Forum
  end

  it 'should not allow members to delete forums' do
    members.should_not be_able_to :destroy, Forum
  end

  it 'should allow members to read topics' do
    members.should be_able_to :read, Topic
  end

  it 'should allow members to create topics' do
    members.should be_able_to :create, Topic
  end

  it 'should allow members to update topics they have created' do
    topic = create_topic_for member
    ability_of(member).should be_able_to :update, topic
  end

  it 'should allow members to destroy topics they have created' do
    topic = create_topic_for member
    ability_of(member).should be_able_to :destroy, topic
  end

  it 'should not allow members to edit topics they have not created' do
    another_member = Factory.build(:member, :id => member.id + 1)
    topic = create_topic_for another_member
    ability_of(member).should_not be_able_to :update, topic
  end

  it 'should not allow members to delete topics they have not created' do
    another_member = Factory.build(:member, :id => member.id + 1)
    topic = create_topic_for another_member
    ability_of(member).should_not be_able_to :destroy, topic
  end

  it 'should allow members to read posts' do
    members.should be_able_to :read, Post
  end

  it 'should allow members to create posts' do
    members.should be_able_to :create, Post
  end

  it 'should allow members to update posts they have created' do
    post = create_post_for member
    ability_of(member).should be_able_to :update, post
  end

  it 'should allow members to destroy posts they have created' do
    post = create_post_for member
    ability_of(member).should be_able_to :destroy, post
  end

  it 'should not allow members to edit posts they have not created' do
    another_member = Factory.build(:member, :id => member.id + 1)
    post = create_post_for another_member
    ability_of(member).should_not be_able_to :update, post
  end

  it 'should not allow members to delete posts they have not created' do
    another_member = Factory.build(:member, :id => member.id + 1)
    post = create_post_for another_member
    ability_of(member).should_not be_able_to :destroy, post
  end

  # Banned Members

  it 'should allow banned members to read categories' do
    banned_members.should be_able_to :read, Category
  end

  it 'should not allow banned members to create categories' do
    banned_members.should_not be_able_to :create, Category
  end

  it 'should not allow banned members to edit categories' do
    banned_members.should_not be_able_to :update, Category
  end

  it 'should not allow banned members to delete categories' do
    banned_members.should_not be_able_to :destroy, Category
  end

  it 'should allow banned members to read forums' do
    banned_members.should be_able_to :read, Forum
  end

  it 'should not allow banned members to create forums' do
    banned_members.should_not be_able_to :create, Forum
  end

  it 'should not allow banned members to edit forums' do
    banned_members.should_not be_able_to :update, Forum
  end

  it 'should not allow banned members to delete forums' do
    banned_members.should_not be_able_to :destroy, Forum
  end

  it 'should allow banned members to read topics' do
    banned_members.should be_able_to :read, Topic
  end

  it 'should not allow banned members to create topics' do
    banned_members.should_not be_able_to :create, Topic
  end

  it 'should not allow banned members to update topics they have created' do
    topic = create_topic_for banned_member
    ability_of(banned_member).should_not be_able_to :update, topic
  end

  it 'should not allow banned members to destroy topics they have created' do
    topic = create_topic_for banned_member
    ability_of(banned_member).should_not be_able_to :destroy, topic
  end

  it 'should not allow banned members to edit topics they have not created' do
    another_member = Factory.build(:member, :id => member.id + 1)
    topic = create_topic_for another_member
    ability_of(banned_member).should_not be_able_to :update, topic
  end

  it 'should not allow banned members to delete topics they have not created' do
    another_member = Factory.build(:member, :id => member.id + 1)
    topic = create_topic_for another_member
    ability_of(banned_member).should_not be_able_to :destroy, topic
  end

  it 'should allow banned members to read posts' do
    banned_members.should be_able_to :read, Post
  end

  it 'should not allow banned members to create posts' do
    banned_members.should_not be_able_to :create, Post
  end

  it 'should not allow banned members to update posts they have created' do
    post = create_post_for banned_member
    ability_of(banned_member).should_not be_able_to :update, post
  end

  it 'should not allow banned members to destroy posts they have created' do
    post = create_post_for banned_member
    ability_of(banned_member).should_not be_able_to :destroy, post
  end

  it 'should not allow banned members to edit posts they have not created' do
    another_member = Factory.build(:member, :id => member.id + 1)
    post = create_post_for another_member
    ability_of(banned_member).should_not be_able_to :update, post
  end

  it 'should not allow banned members to delete posts they have not created' do
    another_member = Factory.build(:member, :id => member.id + 1)
    post = create_post_for another_member
    ability_of(banned_member).should_not be_able_to :destroy, post
  end

  # Moderators

  it 'should allow moderators to read categories' do
    moderators.should be_able_to :read, Category
  end

  it 'should not allow moderators to create categories' do
    moderators.should_not be_able_to :create, Category
  end

  it 'should not allow moderators to edit categories' do
    moderators.should_not be_able_to :update, Category
  end

  it 'should not allow moderators to delete categories' do
    moderators.should_not be_able_to :destroy, Category
  end

  it 'should allow moderators to read forums' do
    moderators.should be_able_to :read, Forum
  end

  it 'should not allow moderators to create forums' do
    moderators.should_not be_able_to :create, Forum
  end

  it 'should not allow moderators to edit forums' do
    moderators.should_not be_able_to :update, Forum
  end

  it 'should not allow moderators to delete forums' do
    moderators.should_not be_able_to :destroy, Forum
  end

  it 'should allow moderators to read topics' do
    moderators.should be_able_to :read, Topic
  end

  it 'should allow moderators to create topics' do
    moderators.should be_able_to :create, Topic
  end

  it 'should allow moderators to update topics they have created' do
    topic = create_topic_for moderator
    ability_of(moderator).should be_able_to :update, topic
  end

  it 'should allow moderators to destroy topics they have created' do
    topic = create_topic_for moderator
    ability_of(moderator).should be_able_to :destroy, topic
  end

  it 'should allow moderators to edit topics they have not created' do
    another_moderator = Factory.build(:moderator, :id => moderator.id + 1)
    topic = create_topic_for another_moderator
    ability_of(moderator).should be_able_to :update, topic
  end

  it 'should not allow moderators to delete topics they have not created' do
    another_moderator = Factory.build(:moderator, :id => moderator.id + 1)
    topic = create_topic_for another_moderator
    ability_of(moderator).should_not be_able_to :destroy, topic
  end

  it 'should allow moderators to read posts' do
    moderators.should be_able_to :read, Post
  end

  it 'should allow moderators to create posts' do
    moderators.should be_able_to :create, Post
  end

  it 'should allow moderators to update posts they have created' do
    post = create_post_for moderator
    ability_of(moderator).should be_able_to :update, post
  end

  it 'should allow moderators to destroy posts they have created' do
    post = create_post_for moderator
    ability_of(moderator).should be_able_to :destroy, post
  end

  it 'should allow moderators to edit posts they have not created' do
    another_moderator = Factory.build(:moderator, :id => moderator.id + 1)
    post = create_post_for another_moderator
    ability_of(moderator).should be_able_to :update, post
  end

  it 'should not allow moderators to delete posts they have not created' do
    another_moderator = Factory.build(:moderator, :id => moderator.id + 1)
    post = create_post_for another_moderator
    ability_of(moderator).should_not be_able_to :destroy, post
  end

  # Banned Moderators

  it 'should allow banned moderators to read categories' do
    banned_moderators.should be_able_to :read, Category
  end

  it 'should not allow banned moderators to create categories' do
    banned_moderators.should_not be_able_to :create, Category
  end

  it 'should not allow banned moderators to edit categories' do
    banned_moderators.should_not be_able_to :update, Category
  end

  it 'should not allow banned moderators to delete categories' do
    banned_moderators.should_not be_able_to :destroy, Category
  end

  it 'should allow banned moderators to read forums' do
    banned_moderators.should be_able_to :read, Forum
  end

  it 'should not allow banned moderators to create forums' do
    banned_moderators.should_not be_able_to :create, Forum
  end

  it 'should not allow banned moderators to edit forums' do
    banned_moderators.should_not be_able_to :update, Forum
  end

  it 'should not allow banned moderators to delete forums' do
    banned_moderators.should_not be_able_to :destroy, Forum
  end

  it 'should allow banned moderators to read topics' do
    banned_moderators.should be_able_to :read, Topic
  end

  it 'should not allow banned moderators to create topics' do
    banned_moderators.should_not be_able_to :create, Topic
  end

  it 'should not allow banned moderators to update topics they have created' do
    topic = create_topic_for banned_moderator
    ability_of(banned_moderator).should_not be_able_to :update, topic
  end

  it 'should not allow banned moderators to destroy topics they have created' do
    topic = create_topic_for banned_moderator
    ability_of(banned_moderator).should_not be_able_to :destroy, topic
  end

  it 'should not allow banned moderators to edit topics they have not created' do
    another_moderator = Factory.build(:moderator, :id => moderator.id + 1)
    topic = create_topic_for another_moderator
    ability_of(banned_moderator).should_not be_able_to :update, topic
  end

  it 'should not allow banned moderators to delete topics they have not created' do
    another_moderator = Factory.build(:moderator, :id => moderator.id + 1)
    topic = create_topic_for another_moderator
    ability_of(banned_moderator).should_not be_able_to :destroy, topic
  end

  it 'should allow banned moderators to read posts' do
    banned_moderators.should be_able_to :read, Post
  end

  it 'should not allow banned moderators to create posts' do
    banned_moderators.should_not be_able_to :create, Post
  end

  it 'should not allow banned moderators to update posts they have created' do
    post = create_post_for banned_moderator
    ability_of(banned_moderator).should_not be_able_to :update, post
  end

  it 'should not allow banned moderators to destroy posts they have created' do
    post = create_post_for banned_moderator
    ability_of(banned_moderator).should_not be_able_to :destroy, post
  end

  it 'should not allow banned moderators to edit posts they have not created' do
    another_moderator = Factory.build(:moderator, :id => moderator.id + 1)
    post = create_post_for another_moderator
    ability_of(banned_moderator).should_not be_able_to :update, post
  end

  it 'should not allow banned moderators to delete posts they have not created' do
    another_moderator = Factory.build(:moderator, :id => moderator.id + 1)
    post = create_post_for another_moderator
    ability_of(banned_moderator).should_not be_able_to :destroy, post
  end

  # Administrators

  it 'should allow administrators to manage categories' do
    administrators.should be_able_to :manage, Category
  end

  it 'should allow administrators to manage forums' do
    administrators.should be_able_to :manage, Forum
  end

  it 'should allow administrators to manage topics' do
    administrators.should be_able_to :manage, Topic
  end

  it 'should allow administrators to manage posts' do
    administrators.should be_able_to :manage, Post
  end

  # Banned Administrators

  it 'should allow banned administrators to manage categories' do
    banned_administrators.should be_able_to :manage, Category
  end

  it 'should allow banned administrators to manage forums' do
    banned_administrators.should be_able_to :manage, Forum
  end

  it 'should allow banned administrators to manage topics' do
    banned_administrators.should be_able_to :manage, Topic
  end

  it 'should allow banned administrators to manage posts' do
    banned_administrators.should be_able_to :manage, Post
  end

end
