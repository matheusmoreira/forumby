require 'spec_helper'

describe Forum do

  subject { Factory(:forum) }

  it { should belong_to(:category) }

  it { should validate_presence_of(:name) }

  it { should ensure_length_of(:name).is_at_least(1).is_at_most(80) }
  it { should ensure_length_of(:description).is_at_most(1000) }

  it { should_not allow_mass_assignment_of(:id) }

  it 'should find forum without category' do
    forum_without_category = Factory(:forum_without_category)
    Forum.without_category.should include forum_without_category
  end

end
