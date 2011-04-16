require 'spec_helper'

describe 'categories/show.html.haml' do

  before :each do
    category = Factory(:category)
    view.should_receive(:category).any_number_of_times.and_return(category)
    render
  end

  it 'should have a show category section' do
    assert_select 'section#show-category'
  end

  it 'should have the correct title' do
    assert_select 'h1', t('categories.show.heading')
  end

  it "should show the category's attributes" do
    assert_select 'section.category' do |categories|
      categories.count.should == 1
      assert_select categories.first, 'h2', Factory(:category).name
      assert_select categories.first, 'p', Factory(:category).description
    end
  end

end
