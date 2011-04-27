require 'spec_helper'

describe 'forums/show.html.haml' do

  let(:forum) { Factory(:forum) }

  before :each do
    view.should_receive(:forum).any_number_of_times.and_return(forum)
    render
  end

  it 'should have a show forum section' do
    assert_select 'section#show-forum'
  end

  it 'should have the correct title' do
    assert_select 'h1', t('forums.show.heading')
  end

  it 'should have a section for the forum' do
    assert_select 'section.forum'
  end

  it "should show the forum's name" do
    assert_select 'h2', forum.name
  end

  it "should show the forum's description" do
    assert_select 'p', forum.description
  end

end
