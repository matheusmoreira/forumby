require 'spec_helper'

describe 'categories/new.html.haml' do

  let(:category) { Category.new }

  before :each do
    view.should_receive(:category).any_number_of_times.and_return(category)
    render
  end

  it 'should have a new category section' do
    assert_select 'section#new-category'
  end

  it 'should have the correct title' do
    assert_select 'h1', t('categories.new.heading')
  end

  it 'should display a new category form' do
    assert_select 'form.new_category'
  end

  it 'should have an empty category name text field' do
    assert_select 'input#category_name[value=?]', ''
  end

  it 'should have an empty category description text area' do
    assert_select 'textarea#category_description', ''
  end

end
