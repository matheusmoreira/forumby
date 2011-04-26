require 'spec_helper'

describe 'categories/forums/index.html.haml' do

  let(:category) { Factory(:category) }
  let(:forums) { category.forums }
  let(:forum) { Factory(:forum) }

  before :each do
    view.should_receive(:category).any_number_of_times.and_return(category)
    view.should_receive(:forums_in_page).any_number_of_times.and_return(forums.paginate :page => 1)
    render
  end

  it 'should have a category/forum index section' do
    assert_select 'section#category-forum-index'
  end

  it 'should have the correct title' do
    assert_select 'h1', t('categories.forums.index.heading', :category => category.name)
  end

  it 'should have navigation controls' do
    assert_select 'nav'
  end

  it 'should include the category in the index' do
      assert_select 'section.forum' do |forums|
        forums.count.should == 1
        assert_select forums.first, 'h2', forum.name
    end
  end

end
