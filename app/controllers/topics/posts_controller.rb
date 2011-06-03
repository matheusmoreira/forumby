class Topics::PostsController < ApplicationController

  before_filter :authenticate_member!, :except => :index

  respond_to :html

  expose(:topic)
  expose(:posts)         { topic.posts }
  expose(:posts_in_page) { posts.paginate :page => params[:page] }
  expose(:post)

  # GET /topics/:topic_id/posts
  def index
    authorize! :index, Post
    respond_with posts
  end

  # GET /topics/:topic_id/posts/new
  def new
    authorize! :new, post
    respond_with post
  end

  # POST /topics/:topic_id/posts
  def create
    authorize! :create, post
    post.topic = topic
    post.member = current_member
    post.save
    respond_with post
  end

end
