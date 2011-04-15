require 'spec_helper'

describe CategoriesController do

  describe 'GET index' do

    it 'should be successful' do
      get 'index'
      response.should be_success
    end

  end

  describe 'GET show' do

    it 'should be successful' do
      get 'show', :id => Factory(:category).id
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
      get 'edit', :id => Factory(:category).id
      response.should be_success
    end

  end

end
