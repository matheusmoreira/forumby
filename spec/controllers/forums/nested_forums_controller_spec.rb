require 'spec_helper'

describe Forums::NestedForumsController do

  let(:nested_forum)    { Factory(:forum_with_parent) }
  let(:parent_forum)    { nested_forum.parent_forum }
  let(:nested_forum_id) { nested_forum.id }
  let(:parent_forum_id) { parent_forum.id }

  context 'with regular members' do

    before :each do
      sign_in_member
    end

    after :each do
      sign_out_member
    end

    describe 'GET index' do
      it 'should be successful' do
        get 'index', :forum_id => parent_forum_id
        response.should be_success
      end
    end

    describe 'GET new' do
      it 'should not be successful' do
        get 'new', :forum_id => parent_forum_id
        response.should_not be_success
      end
    end

  end

  context 'with moderator' do

    before :each do
      sign_in_moderator
    end

    after :each do
      sign_out_moderator
    end

    describe 'GET index' do
      it 'should be successful' do
        get 'index', :forum_id => parent_forum_id
        response.should be_success
      end
    end

    describe 'GET new' do
      it 'should not be successful' do
        get 'new', :forum_id => parent_forum_id
        response.should_not be_success
      end
    end

  end

  context 'with administrator' do

    before :each do
      sign_in_administrator
    end

    after :each do
      sign_out_administrator
    end

    describe 'GET index' do
      it 'should be successful' do
        get 'index', :forum_id => parent_forum_id
        response.should be_success
      end
    end

    describe 'GET new' do
      it 'should be successful' do
        get 'new', :forum_id => parent_forum_id
        response.should be_success
      end
    end

  end

end
