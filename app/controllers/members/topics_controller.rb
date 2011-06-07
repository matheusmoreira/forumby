class Members::TopicsController < ApplicationController

  respond_to :html

  expose(:member)
  expose(:topics)         { member.topics }
  expose(:topics_in_page) { topics.paginate :page => params[:page] }

  # GET /members/:member_id/topics
  def index
    authorize! :index, Topic
    respond_with topics
  end

end
