require 'spec_helper'

describe 'categories/index.html.haml' do

  before :each do
    category = Factory(:category)
    view.should_receive(:categories_in_page).any_number_of_times.and_return([ category ].paginate)
    render
  end

  it 'should have a category index section' do
    assert_select 'section#category-index'
  end

  it 'should have the correct title' do
    assert_select 'h1', t('categories.index.heading')
  end

  it 'should have navigation controls' do
    assert_select 'nav'
  end

  it 'should include the category in the index' do
      assert_select 'section.category' do |categories|
        categories.count.should == 1
        assert_select categories.first, 'h2', Factory(:category).name
    end
  end

end
