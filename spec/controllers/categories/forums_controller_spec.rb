require 'spec_helper'

describe Categories::ForumsController do

  let(:forum)       { Factory(:forum_with_category) }
  let(:category)    { forum.category }
  let(:forum_id)    { forum.id }
  let(:category_id) { category.id }

  context 'with regular members' do

    before :each do
      sign_in_member
    end

    describe 'GET index' do
      it 'should be successful' do
        get 'index', :category_id => category_id
        response.should be_success
      end
    end

    describe 'GET new' do
      it 'should not be successful' do
        get 'new', :category_id => category_id
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
        get 'index', :category_id => category_id
        response.should be_success
      end
    end

    describe 'GET new' do
      it 'should not be successful' do
        get 'new', :category_id => category_id
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
        get 'index', :category_id => category_id
        response.should be_success
      end
    end

    describe 'GET new' do
      it 'should be successful' do
        get 'new', :category_id => category_id
        response.should be_success
      end
    end

  end

end
