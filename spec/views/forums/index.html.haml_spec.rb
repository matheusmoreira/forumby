require 'spec_helper'

describe 'forums/index.html.haml' do

  before :each do
    forum = Factory(:forum)
    view.should_receive(:forums_in_page).any_number_of_times.and_return([ forum ].paginate)
    render
  end

  it 'should have a forum index section' do
    assert_select 'section#forum-index'
  end

  it 'should have the correct title' do
    assert_select 'h1', t('forums.index.heading')
  end

  it 'should have navigation controls' do
    assert_select 'nav'
  end

  it 'should include the forum in the index' do
      assert_select 'section.forum' do |forums|
        forums.count.should == 1
        assert_select forums.first, 'h2', Factory(:forum).name
    end
  end

end
