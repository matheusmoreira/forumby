require 'spec_helper'

describe TopicsController do

  context 'without member' do

    let(:topic) { Factory(:topic) }

    describe 'GET index' do
      it 'should be successful' do
        get 'index'
        response.should be_success
      end
    end

    describe 'GET show' do
      it 'should be successful' do
        get 'show', :id => topic.id
        response.should be_success
      end
    end

    describe 'GET edit' do
      it 'should not be successful' do
        get 'edit', :id => topic.id
        response.should_not be_success
      end
    end

  end

  context 'with a regular member' do

    let(:member) { Factory(:member) }

    before :each do
      sign_in member
    end

    context 'who owns the topic' do

      let(:topic) { create_topic_for member }

      describe 'GET index' do
        it 'should be successful' do
          get 'index'
          response.should be_success
        end
      end

      describe 'GET show' do
        it 'should be successful' do
          get 'show', :id => topic.id
          response.should be_success
        end
      end

      describe 'GET edit' do
        it 'should be successful' do
          get 'edit', :id => topic.id
          response.should be_success
        end
      end

    end

    context 'who does not own the topic' do

      let(:another_member) { Factory(:member) }
      let(:topic)          { create_topic_for another_member }

      describe 'GET index' do
        it 'should be successful' do
          get 'index'
          response.should be_success
        end
      end

      describe 'GET show' do
        it 'should be successful' do
          get 'show', :id => topic.id
          response.should be_success
        end
      end

      describe 'GET edit' do
        it 'should not be successful' do
          get 'edit', :id => topic.id
          response.should_not be_success
        end
      end

    end

  end

  context 'with a banned member' do

    let(:banned_member) { Factory(:banned_member) }

    before :each do
      sign_in banned_member
    end

    context 'who owns the topic' do

      let(:topic) { create_topic_for banned_member }

      describe 'GET index' do
        it 'should be successful' do
          get 'index'
          response.should be_success
        end
      end

      describe 'GET show' do
        it 'should be successful' do
          get 'show', :id => topic.id
          response.should be_success
        end
      end

      describe 'GET edit' do
        it 'should not be successful' do
          get 'edit', :id => topic.id
          response.should_not be_success
        end
      end

    end

    context 'who does not own the topic' do

      let(:another_member) { Factory(:member) }
      let(:topic)          { create_topic_for another_member }

      describe 'GET index' do
        it 'should be successful' do
          get 'index'
          response.should be_success
        end
      end

      describe 'GET show' do
        it 'should be successful' do
          get 'show', :id => topic.id
          response.should be_success
        end
      end

      describe 'GET edit' do
        it 'should not be successful' do
          get 'edit', :id => topic.id
          response.should_not be_success
        end
      end

    end

  end

  context 'with a moderator' do

    let(:moderator) { Factory(:moderator) }

    before :each do
      sign_in moderator
    end

    context 'who owns the topic' do

      let(:topic) { create_topic_for moderator }

      describe 'GET index' do
        it 'should be successful' do
          get 'index'
          response.should be_success
        end
      end

      describe 'GET show' do
        it 'should be successful' do
          get 'show', :id => topic.id
          response.should be_success
        end
      end

      describe 'GET edit' do
        it 'should be successful' do
          get 'edit', :id => topic.id
          response.should be_success
        end
      end

    end

    context 'who does not own the topic' do

      let(:another_member) { Factory(:member) }
      let(:topic)          { create_topic_for another_member }

      describe 'GET index' do
        it 'should be successful' do
          get 'index'
          response.should be_success
        end
      end

      describe 'GET show' do
        it 'should be successful' do
          get 'show', :id => topic.id
          response.should be_success
        end
      end

      describe 'GET edit' do
        it 'should be successful' do
          get 'edit', :id => topic.id
          response.should be_success
        end
      end

    end

  end

  context 'with a banned moderator' do

    let(:banned_moderator) { Factory(:banned_moderator) }

    before :each do
      sign_in banned_moderator
    end

    context 'who owns the topic' do

      let(:topic) { create_topic_for banned_moderator }

      describe 'GET index' do
        it 'should be successful' do
          get 'index'
          response.should be_success
        end
      end

      describe 'GET show' do
        it 'should be successful' do
          get 'show', :id => topic.id
          response.should be_success
        end
      end

      describe 'GET edit' do
        it 'should not be successful' do
          get 'edit', :id => topic.id
          response.should_not be_success
        end
      end

    end

    context 'who does not own the topic' do

      let(:another_member) { Factory(:member) }
      let(:topic)          { create_topic_for another_member }

      describe 'GET index' do
        it 'should be successful' do
          get 'index'
          response.should be_success
        end
      end

      describe 'GET show' do
        it 'should be successful' do
          get 'show', :id => topic.id
          response.should be_success
        end
      end

      describe 'GET edit' do
        it 'should not be successful' do
          get 'edit', :id => topic.id
          response.should_not be_success
        end
      end

    end

  end

  context 'with an administrator' do

    let(:administrator) { Factory(:administrator) }

    before :each do
      sign_in administrator
    end

    context 'who owns the topic' do

      let(:topic) { create_topic_for administrator }

      describe 'GET index' do
        it 'should be successful' do
          get 'index'
          response.should be_success
        end
      end

      describe 'GET show' do
        it 'should be successful' do
          get 'show', :id => topic.id
          response.should be_success
        end
      end

      describe 'GET edit' do
        it 'should be successful' do
          get 'edit', :id => topic.id
          response.should be_success
        end
      end

    end

    context 'who does not own the topic' do

      let(:another_member) { Factory(:member) }
      let(:topic)          { create_topic_for another_member }

      describe 'GET index' do
        it 'should be successful' do
          get 'index'
          response.should be_success
        end
      end

      describe 'GET show' do
        it 'should be successful' do
          get 'show', :id => topic.id
          response.should be_success
        end
      end

      describe 'GET edit' do
        it 'should be successful' do
          get 'edit', :id => topic.id
          response.should be_success
        end
      end

    end

  end

  context 'with a banned administrator' do

    let(:banned_administrator) { Factory(:banned_administrator) }

    before :each do
      sign_in banned_administrator
    end

    context 'who owns the topic' do

      let(:topic) { create_topic_for banned_administrator }

      describe 'GET index' do
        it 'should be successful' do
          get 'index'
          response.should be_success
        end
      end

      describe 'GET show' do
        it 'should be successful' do
          get 'show', :id => topic.id
          response.should be_success
        end
      end

      describe 'GET edit' do
        it 'should be successful' do
          get 'edit', :id => topic.id
          response.should be_success
        end
      end

    end

    context 'who does not own the topic' do

      let(:another_member) { Factory(:member) }
      let(:topic)          { create_topic_for another_member }

      describe 'GET index' do
        it 'should be successful' do
          get 'index'
          response.should be_success
        end
      end

      describe 'GET show' do
        it 'should be successful' do
          get 'show', :id => topic.id
          response.should be_success
        end
      end

      describe 'GET edit' do
        it 'should be successful' do
          get 'edit', :id => topic.id
          response.should be_success
        end
      end

    end

  end

end
