require 'spec_helper'

describe MembersController do

  context 'with regular member' do

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
        get 'show', :id => Factory(:member).id
        response.should be_success
      end
    end

  end

end
