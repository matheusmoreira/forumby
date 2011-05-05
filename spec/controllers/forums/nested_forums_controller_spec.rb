require 'spec_helper'

describe Forums::NestedForumsController do

  let(:forum)        { Factory(:forum) }
  let(:forum_id)     { forum.id }
  let(:nested_forum) { Factory(:forum, :name => 'Nested Forum', :parent_forum => forum) }

  context 'with regular members' do

    before :each do
      sign_in Factory.build(:member)
    end

    describe 'GET index' do
      it 'should be successful' do
        get 'index', :forum_id => forum_id
        response.should be_success
      end
    end

    describe 'GET new' do
      it 'should not be successful' do
        get 'new', :forum_id => forum_id
        response.should_not be_success
      end
    end

  end

  context 'with moderator' do

    before :each do
      sign_in Factory.build(:moderator)
    end

    describe 'GET index' do
      it 'should be successful' do
        get 'index', :forum_id => forum_id
        response.should be_success
      end
    end

    describe 'GET new' do
      it 'should not be successful' do
        get 'new', :forum_id => forum_id
        response.should_not be_success
      end
    end

  end

  context 'with administrator' do

    before :each do
      sign_in Factory.build(:administrator)
    end

    describe 'GET index' do
      it 'should be successful' do
        get 'index', :forum_id => forum_id
        response.should be_success
      end
    end

    describe 'GET new' do
      it 'should be successful' do
        get 'new', :forum_id => forum_id
        response.should be_success
      end
    end

  end

end
