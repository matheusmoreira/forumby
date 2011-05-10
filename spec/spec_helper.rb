ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|

  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.include Devise::TestHelpers, :type => :controller

  def sign_in_member
    sign_in Factory(:member)
  end

  def sign_in_moderator
    sign_in Factory(:moderator)
  end

  def sign_in_administrator
    sign_in Factory(:administrator)
  end

  def sign_out_member
    sign_out :member
  end

  alias :sign_out_moderator     :sign_out_member
  alias :sign_out_administrator :sign_out_member

end
