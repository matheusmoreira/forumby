class ForumbyController < ApplicationController

  skip_authorization_check

  respond_to :html

  expose(:categories)       { Category.all }
  expose(:top_level_forums) { Forum.top_level }

  def home
  end

end
