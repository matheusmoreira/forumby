require 'spec_helper'

describe 'forums/index.html.haml' do

  let(:forum) { Factory(:forum) }

  before :each do
    view.should_receive(:forums_in_page).any_number_of_times.and_return([ forum ].paginate)
    render
  end

  it 'should have a forum index section' do
    assert_select 'section#forum-index'
  end

  it 'should have the correct title' do
    assert_select 'h1', t('forums.index.heading')
  end

  it 'should have a section for the forum' do
    assert_select 'section.forum'
  end

  it "should show the forum's name in the index" do
    assert_select 'h2', forum.name
  end

  it 'should have navigation controls' do
    assert_select 'nav'
  end

end
