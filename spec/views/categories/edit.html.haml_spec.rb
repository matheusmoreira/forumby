require 'spec_helper'

describe 'categories/edit.html.haml' do

  let(:category) { Factory(:category) }

  before :each do
    view.should_receive(:category).any_number_of_times.and_return(category)
    render
  end

  it 'should have an edit category section' do
    assert_select 'section#edit-category'
  end

  it 'should have the correct title' do
    assert_select 'h1', t('categories.edit.heading')
  end

  it 'should display an edit category form' do
    assert_select 'form.edit_category' do
      assert_select 'input#category_name[value=?]', category.name
      assert_select 'textarea#category_description', category.description
    end
  end

end
