ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|

  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.include Devise::TestHelpers, :type => :controller

  def create_post_for(member)
    Factory(:post, :member => member)
  end

  def create_topic_for(member)
    Factory(:topic).tap do |topic|
      Factory(:post, :topic => topic, :member => member)
    end
  end

  def ability_of(member)
    MemberAbility.new member
  end

  def ability_for(*args)
    MemberAbility.new Factory(*args)
  end

end
