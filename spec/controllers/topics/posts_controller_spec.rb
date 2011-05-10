require 'spec_helper'

describe Topics::PostsController do

  let(:post)     { Factory(:post) }
  let(:topic)    { post.topic }
  let(:post_id)  { post.id }
  let(:topic_id) { topic.id }

  context 'with regular members' do

    before :each do
      sign_in_member
    end

    describe 'GET index' do
      it 'should be successful' do
        get 'index', :topic_id => topic_id
        response.should be_success
      end
    end

    describe 'GET new' do
      it 'should not be successful' do
        get 'new', :topic_id => topic_id
        response.should_not be_success
      end
    end

  end

  context 'with moderator' do

    before :each do
      sign_in_moderator
    end

    describe 'GET index' do
      it 'should be successful' do
        get 'index', :topic_id => topic_id
        response.should be_success
      end
    end

    describe 'GET new' do
      it 'should not be successful' do
        get 'new', :topic_id => topic_id
        response.should_not be_success
      end
    end

  end

  context 'with administrator' do

    before :each do
      sign_in_administrator
    end

    describe 'GET index' do
      it 'should be successful' do
        get 'index', :topic_id => topic_id
        response.should be_success
      end
    end

    describe 'GET new' do
      it 'should be successful' do
        get 'new', :topic_id => topic_id
        response.should be_success
      end
    end

  end

end
