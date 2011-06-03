require 'spec_helper'

describe MembersController do

  context 'without member' do

    let(:member) { Factory(:member) }

    describe 'GET index' do
      it 'should be successful' do
        get 'index'
        response.should be_success
      end
    end

    describe 'GET show' do
      it 'should be successful' do
        get 'show', :id => member.id
        response.should be_success
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
        get 'index'
        response.should be_success
      end
    end

    describe 'GET show' do
      it 'should be successful' do
        get 'show', :id => member.id
        response.should be_success
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
        get 'index'
        response.should be_success
      end
    end

    describe 'GET show' do
      it 'should be successful' do
        get 'show', :id => banned_member.id
        response.should be_success
      end
    end

  end

  context 'with a regular moderator' do

    let(:moderator) { Factory(:moderator) }

    before :each do
      sign_in moderator
    end

    describe 'GET index' do
      it 'should be successful' do
        get 'index'
        response.should be_success
      end
    end

    describe 'GET show' do
      it 'should be successful' do
        get 'show', :id => moderator.id
        response.should be_success
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
        get 'index'
        response.should be_success
      end
    end

    describe 'GET show' do
      it 'should be successful' do
        get 'show', :id => banned_moderator.id
        response.should be_success
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
        get 'index'
        response.should be_success
      end
    end

    describe 'GET show' do
      it 'should be successful' do
        get 'show', :id => administrator.id
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
        get 'index'
        response.should be_success
      end
    end

    describe 'GET show' do
      it 'should be successful' do
        get 'show', :id => banned_administrator.id
        response.should be_success
      end
    end

  end

end
