require 'spec_helper'

describe 'categories/show.html.haml' do

  let(:category) { Factory(:category) }
  let(:forum) { Factory(:forum) }

  before :each do
    view.should_receive(:category).any_number_of_times.and_return(category)
    view.should_receive(:forums).any_number_of_times.and_return([ forum ].paginate)
    render
  end

  it 'should have a show category section' do
    assert_select 'section#show-category'
  end

  it 'should have the correct title' do
    assert_select 'h1', t('categories.show.heading')
  end

  it 'should have a section for the category' do
    assert_select 'section.category'
  end

  it "should show the category's name" do
    assert_select 'h2', category.name
  end

  it "should show the category's description" do
    assert_select 'p', category.description
  end

  it "should have a section for the category's forums" do
    assert_select '.category-forums'
  end

  it "should have a section for the category's forum" do
    assert_select 'section.forum'
  end

  it "should show the category's forum's name" do
    assert_select 'h2', forum.name
  end

end
