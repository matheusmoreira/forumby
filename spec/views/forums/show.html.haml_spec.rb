require 'spec_helper'

describe 'forums/show.html.haml' do

  before :each do
    forum = Factory(:forum)
    view.should_receive(:forum).any_number_of_times.and_return(forum)
    render
  end

  it 'should have a show forum section' do
    assert_select 'section#show-forum'
  end

  it 'should have the correct title' do
    assert_select 'h1', t('forums.show.heading')
  end

  it "should show the forum's attributes" do
    assert_select 'section.forum' do |forums|
      forums.count.should == 1
      assert_select forums.first, 'h2', Factory(:forum).name
      assert_select forums.first, 'p', Factory(:forum).description
    end
  end

end
