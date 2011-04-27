require 'spec_helper'

describe 'members/index.html.haml' do

  let(:member) { Factory(:member) }

  before :each do
    view.should_receive(:members_in_page).any_number_of_times.and_return([ member ].paginate)
    render
  end

  it 'should have a member index section' do
    assert_select 'section#member-index'
  end

  it 'should have the correct title' do
    assert_select 'h1', t('members.index.heading')
  end

  it 'should have a section for the member' do
    assert_select 'section.member'
  end

  it 'should include the member in the index' do
    assert_select 'h2', member.name
  end

  it 'should have navigation controls' do
    assert_select 'nav'
  end

end
