class Forums::TopicsController < ApplicationController

  before_filter :authenticate_member!, :except => :index

  respond_to :html

  expose(:forum)
  expose(:topics)         { forum.topics }
  expose(:topics_in_page) { topics.paginate :page => params[:page] }
  expose(:topic)
  expose(:first_post)     { topic.first_post }

  authorize_resource

  # GET /forums/:forum_id/topics
  def index
    respond_with topics
  end

  # GET /forums/:forum_id/topics/new
  def new
    respond_with topic
  end

  # POST /forums/:forum_id/topics
  def create
    topic.forum = forum
    first_post.topic = topic
    first_post.member = current_member
    respond_with topic
  end

end
