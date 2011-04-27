require 'spec_helper'

describe 'forums/edit.html.haml' do

  let(:forum) { Factory(:forum) }

  before :each do
    view.should_receive(:forum).any_number_of_times.and_return(forum)
    render
  end

  it 'should have an edit forum section' do
    assert_select 'section#edit-forum'
  end

  it 'should have the correct title' do
    assert_select 'h1', t('forums.edit.heading')
  end

  it 'should display an edit forum form' do
    assert_select 'form.edit_forum'
  end

  it "should have a category name text field prefilled with the forum's name" do
    assert_select 'input#forum_name[value=?]', forum.name
  end

  it "should have a category name text area prefilled with the forum's description" do
    assert_select 'textarea#forum_description', forum.description
  end

end
