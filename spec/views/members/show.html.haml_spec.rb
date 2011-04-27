require 'spec_helper'

describe 'members/show.html.haml' do

  let(:member) { Factory(:member) }

  before :each do
    view.should_receive(:member).any_number_of_times.and_return(member)
    render
  end

  it 'should have a show member section' do
    assert_select 'section#show-member'
  end

  it 'should have the correct title' do
    assert_select 'h1', t('members.show.heading')
  end

  it "should show the member's public profile" do
    assert_select 'section.member' do |members|
      members.count.should == 1
      assert_select members.first, 'h2', member.name
    end
  end

end
