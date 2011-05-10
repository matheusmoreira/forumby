require 'spec_helper'

describe CategoriesController do

  let(:category)    { Factory(:category) }
  let(:category_id) { category.id }

  context 'with regular members' do

    before :each do
      sign_in_member
    end

    describe 'GET index' do
      it 'should be successful' do
        get 'index'
        response.should be_success
      end
    end

    describe 'GET show' do
      it 'should be successful' do
        get 'show', :id => category_id
        response.should be_success
      end
    end

    describe 'GET new' do
      it 'should not be successful' do
        get 'new'
        response.should_not be_success
      end
    end

    describe 'GET edit' do
      it 'should not be successful' do
        get 'edit', :id => category_id
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
        get 'index'
        response.should be_success
      end
    end

    describe 'GET show' do
      it 'should be successful' do
        get 'show', :id => category_id
        response.should be_success
      end
    end

    describe 'GET new' do
      it 'should not be successful' do
        get 'new'
        response.should_not be_success
      end
    end

    describe 'GET edit' do
      it 'should not be successful' do
        get 'edit', :id => category_id
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
        get 'index'
        response.should be_success
      end
    end

    describe 'GET show' do
      it 'should be successful' do
        get 'show', :id => category_id
        response.should be_success
      end
    end

    describe 'GET new' do
      it 'should be successful' do
        get 'new'
        response.should be_success
      end
    end

    describe 'GET edit' do
      it 'should be successful' do
        get 'edit', :id => category_id
        response.should be_success
      end
    end

  end

end
