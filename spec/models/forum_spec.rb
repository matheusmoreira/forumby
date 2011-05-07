require 'spec_helper'

describe Forum do

  let(:forum)                  { Factory(:forum) }
  let(:topic)                  { Factory(:topic) }
  let(:forum_without_category) { Factory(:forum_without_category) }
  let(:forum_with_category)    { Factory(:forum_with_category) }
  let(:forum_without_parent)   { Factory(:forum_without_parent) }
  let(:forum_with_parent)      { Factory(:forum_with_parent) }
  let(:top_level_forum)        { Factory(:top_level_forum) }

  subject                      { forum }

  it { should have_many(:nested_forums) }
  it { should have_many(:topics) }

  it { should belong_to(:category) }
  it { should belong_to(:parent_forum) }

  it { should validate_presence_of(:name) }

  it { should ensure_length_of(:name).is_at_least(1).is_at_most(80) }
  it { should ensure_length_of(:description).is_at_most(1000) }

  it { should_not allow_mass_assignment_of(:id) }

  it 'should find forum without category' do
    Forum.without_category.should include forum_without_category
  end

  it 'should find forum without parent forum' do
    Forum.without_parent.should include forum_without_parent
  end

  it 'should find top level forums' do
    Forum.top_level.should include top_level_forum
  end

  it 'should not have a category' do
    forum_without_category.has_category?.should be_false
  end

  it 'should have a category' do
    forum_with_category.has_category?.should be_true
  end

  it 'should have no nested forums' do
    forum.has_nested_forums?.should be_false
  end

  it 'should have nested forums' do
    forum.stub!(:nested_forums).and_return [ forum_with_parent ]
    forum.has_nested_forums?.should be_true
  end

  it 'should have no topics' do
    forum.has_topics?.should be_false
  end

  it 'should have topics' do
    forum.stub!(:topics).and_return [ topic ]
    forum.has_topics?.should be_true
  end

  it 'should not be nested' do
    forum_without_parent.nested?.should be_false
  end

  it 'should be nested' do
    forum_with_parent.nested?.should be_true
  end

end
