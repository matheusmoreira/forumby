require 'spec_helper'

describe Category do

  let(:category)                     { Factory(:category) }
  let(:category_without_description) { Factory(:category_without_description) }
  let(:category_with_description)    { Factory(:category_with_description) }

  subject                            { category }

  it { should have_many(:forums) }

  it { should validate_presence_of(:name) }

  it { should ensure_length_of(:name).is_at_least(1).is_at_most(80) }
  it { should ensure_length_of(:description).is_at_most(1000) }

  it { should_not allow_mass_assignment_of(:id) }

  it 'should have no description' do
    category_without_description.has_description?.should be_false
  end

  it 'should have a description' do
    category_with_description.has_description?.should be_true
  end

end
