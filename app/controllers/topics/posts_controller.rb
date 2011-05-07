class Topics::PostsController < ApplicationController

  before_filter :authenticate_member!, :except => :index

  respond_to :html

  expose(:topic)
  expose(:posts)         { topic.posts }
  expose(:posts_in_page) { posts.paginate :page => params[:page] }
  expose(:post)

  authorize_resource

  # GET /topics/:topic_id/posts
  def index
    respond_with post
  end

  # GET /topics/:topic_id/posts/new
  def new
    respond_with post
  end

  # POST /topics/:topic_id/posts
  def create
    post.topic = topic
    post.save
    respond_with post
  end

end
