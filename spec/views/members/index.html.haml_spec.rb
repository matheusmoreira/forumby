require 'spec_helper'

describe 'members/index.html.haml' do

  before :each do
    member = Factory(:member)
    view.should_receive(:members_in_page).any_number_of_times.and_return([ member ].paginate)
    render
  end

  it 'should have a member index section' do
    assert_select 'section#member-index'
  end

  it 'should have the correct title' do
    assert_select 'h1', t('members.index.heading')
  end

  it 'should have navigation controls' do
    assert_select 'nav'
  end

  it 'should include the member in the index' do
      assert_select 'section.member' do |members|
        members.count.should == 1
        assert_select members.first, 'h2', Factory.build(:member).name
    end
  end

end
