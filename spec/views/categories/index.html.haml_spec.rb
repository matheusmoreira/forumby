require 'spec_helper'

describe 'categories/index.html.haml' do

  let(:category) { Factory(:category) }

  before :each do
    view.should_receive(:categories_in_page).any_number_of_times.and_return([ category ].paginate)
    render
  end

  it 'should have a category index section' do
    assert_select 'section#category-index'
  end

  it 'should have the correct title' do
    assert_select 'h1', t('categories.index.heading')
  end

  it 'should have a section for the category' do
    assert_select 'section.category'
  end

  it "should show the category's name in the index" do
    assert_select 'h2', category.name
  end

  it 'should have navigation controls' do
    assert_select 'nav'
  end

end
