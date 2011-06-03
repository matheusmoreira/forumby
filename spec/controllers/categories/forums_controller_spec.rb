require 'spec_helper'

describe Categories::ForumsController do

  let(:category) { Factory(:category) }

  context 'without member' do

    describe 'GET index' do
      it 'should be successful' do
        get 'index', :category_id => category.id
        response.should be_success
      end
    end

    describe 'GET new' do
      it 'should not be successful' do
        get 'new', :category_id => category.id
        response.should_not be_success
      end
    end

  end

  context 'with a regular member' do

    let(:member) { Factory(:member) }

    before :each do
      sign_in member
    end

    describe 'GET index' do
      it 'should be successful' do
        get 'index', :category_id => category.id
        response.should be_success
      end
    end

    describe 'GET new' do
      it 'should not be successful' do
        get 'new', :category_id => category.id
        response.should_not be_success
      end
    end

  end

  context 'with a banned member' do

    let(:banned_member) { Factory(:banned_member) }

    before :each do
      sign_in banned_member
    end

    describe 'GET index' do
      it 'should be successful' do
        get 'index', :category_id => category.id
        response.should be_success
      end
    end

    describe 'GET new' do
      it 'should not be successful' do
        get 'new', :category_id => category.id
        response.should_not be_success
      end
    end

  end

  context 'with a moderator' do

    let(:moderator) { Factory(:moderator) }

    before :each do
      sign_in moderator
    end

    describe 'GET index' do
      it 'should be successful' do
        get 'index', :category_id => category.id
        response.should be_success
      end
    end

    describe 'GET new' do
      it 'should not be successful' do
        get 'new', :category_id => category.id
        response.should_not be_success
      end
    end

  end

  context 'with a banned moderator' do

    let(:banned_moderator) { Factory(:banned_moderator) }

    before :each do
      sign_in banned_moderator
    end

    describe 'GET index' do
      it 'should be successful' do
        get 'index', :category_id => category.id
        response.should be_success
      end
    end

    describe 'GET new' do
      it 'should not be successful' do
        get 'new', :category_id => category.id
        response.should_not be_success
      end
    end

  end

  context 'with an administrator' do

    let(:administrator) { Factory(:administrator) }

    before :each do
      sign_in administrator
    end

    describe 'GET index' do
      it 'should be successful' do
        get 'index', :category_id => category.id
        response.should be_success
      end
    end

    describe 'GET new' do
      it 'should be successful' do
        get 'new', :category_id => category.id
        response.should be_success
      end
    end

  end

  context 'with a banned administrator' do

    let(:banned_administrator) { Factory(:banned_administrator) }

    before :each do
      sign_in banned_administrator
    end

    describe 'GET index' do
      it 'should be successful' do
        get 'index', :category_id => category.id
        response.should be_success
      end
    end

    describe 'GET new' do
      it 'should be successful' do
        get 'new', :category_id => category.id
        response.should be_success
      end
    end

  end

end
