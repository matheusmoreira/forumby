class PostsController < ApplicationController

  before_filter :authenticate_member!, :except => [ :index, :show ]

  respond_to :html

  expose(:posts)         { Post.all }
  expose(:posts_in_page) { posts.paginate :page => params[:page] }
  expose(:post)

  authorize_resource

  # GET /posts
  def index
    respond_with posts
  end

  # GET /posts/:id
  def show
    respond_with post
  end

  # GET /posts/:id/edit
  def edit
    respond_with post
  end

  # PUT /posts/:id
  def update
    post.update_attributes params[:post]
    respond_with post
  end

  # DELETE /posts/:id
  def destroy
    post.destroy
    respond_with post
  end

end
