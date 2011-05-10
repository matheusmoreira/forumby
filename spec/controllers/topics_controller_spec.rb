require 'spec_helper'

describe TopicsController do

  let(:topic)    { Factory(:topic) }
  let(:topic_id) { topic.id }

  context 'with regular members' do

    before :each do
      sign_in_member
    end

    after :each do
      sign_out_member
    end

    describe 'GET index' do
      it 'should be successful' do
        get 'index'
        response.should be_success
      end
    end

    describe 'GET show' do
      it 'should be successful' do
        get 'show', :id => topic_id
        response.should be_success
      end
    end

    describe 'GET edit' do
      it 'should not be successful' do
        get 'edit', :id => topic_id
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
        get 'index'
        response.should be_success
      end
    end

    describe 'GET show' do
      it 'should be successful' do
        get 'show', :id => topic_id
        response.should be_success
      end
    end

    describe 'GET edit' do
      it 'should not be successful' do
        get 'edit', :id => topic_id
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
        get 'index'
        response.should be_success
      end
    end

    describe 'GET show' do
      it 'should be successful' do
        get 'show', :id => topic_id
        response.should be_success
      end
    end

    describe 'GET edit' do
      it 'should be successful' do
        get 'edit', :id => topic_id
        response.should be_success
      end
    end

  end

end
