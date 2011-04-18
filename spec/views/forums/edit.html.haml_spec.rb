require 'spec_helper'

describe 'forums/edit.html.haml' do

  before :each do
    forum = Factory(:forum)
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
    assert_select 'form.edit_forum' do
      assert_select 'input#forum_name[value=?]', Factory(:forum).name
      assert_select 'textarea#forum_description', Factory(:forum).description
    end
  end

end
