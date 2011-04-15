require 'spec_helper'

describe Category do

  subject { Factory(:category) }

  it { should validate_presence_of(:name) }

  it { should ensure_length_of(:name).is_at_least(1).is_at_most(80) }
  it { should ensure_length_of(:description).is_at_most(1000) }

  it { should_not allow_mass_assignment_of(:id) }

end
