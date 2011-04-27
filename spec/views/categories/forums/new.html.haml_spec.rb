require 'spec_helper'

describe 'categories/forums/new.html.haml' do

  let(:category) { Factory(:category) }
  let(:forum) { Forum.new }

  before :each do
    view.should_receive(:category).any_number_of_times.and_return(category)
    view.should_receive(:forum).any_number_of_times.and_return(forum)
    render
  end

  it 'should have a new category/forum section' do
    assert_select 'section#category-new-forum'
  end

  it 'should have the correct title' do
    assert_select 'h1', t('categories.forums.new.heading')
  end

  it 'should have a new forum form' do
    assert_select 'form.new_forum'
  end

  it 'should have an empty forum name text field' do
    assert_select 'input#forum_name[value=?]', ''
  end

  it 'should have an empty forum description text area' do
    assert_select 'textarea#forum_description', ''
  end

end
