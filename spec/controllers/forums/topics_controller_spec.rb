require 'spec_helper'

describe Forums::TopicsController do

  let(:topic)    { Factory(:topic) }
  let(:forum)    { topic.forum }
  let(:topic_id) { topic.id }
  let(:forum_id) { forum.id }

  context 'with regular members' do

    before :each do
      sign_in_member
    end

    after :each do
      sign_out_member
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
      sign_in_moderator
    end

    after :each do
      sign_out_moderator
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
      sign_in_administrator
    end

    after :each do
      sign_out_administrator
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
