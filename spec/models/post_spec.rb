require 'spec_helper'

describe Post do

  subject { Factory(:post) }

  it { should belong_to(:topic) }

  it { should validate_presence_of(:member) }
  it { should validate_presence_of(:topic) }
  it { should validate_presence_of(:content) }

  it { should ensure_length_of(:content).is_at_least(1) }

  it { should_not allow_mass_assignment_of(:id) }

end
