require 'spec_helper'

describe Topic do

  subject { Factory(:topic) }

  it { should have_many(:posts) }

  it { should belong_to(:forum) }

  it { should validate_presence_of(:title) }

  it { should ensure_length_of(:title).is_at_least(1).is_at_most(80) }

  it { should_not allow_mass_assignment_of(:id) }

end
