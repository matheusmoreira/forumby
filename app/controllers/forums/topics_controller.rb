class Forums::TopicsController < ApplicationController

  before_filter :authenticate_member!, :except => :index

  respond_to :html

  expose(:forum)
  expose(:topics)         { forum.topics }
  expose(:topics_in_page) { topics.paginate :page => params[:page] }
  expose(:topic)
  expose(:first_post)     { topic.first_post }

  # GET /forums/:forum_id/topics
  def index
    authorize! :index, Topic
    respond_with topics
  end

  # GET /forums/:forum_id/topics/new
  def new
    authorize! :new, topic
    respond_with topic
  end

  # POST /forums/:forum_id/topics
  def create
    authorize! :create, topic
    topic.forum = forum
    first_post.topic = topic
    first_post.member = current_member
    topic.save
    respond_with topic
  end

end
