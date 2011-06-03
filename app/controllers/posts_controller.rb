class PostsController < ApplicationController

  before_filter :authenticate_member!, :except => [ :index, :show ]

  respond_to :html

  expose(:posts)         { Post.all }
  expose(:posts_in_page) { posts.paginate :page => params[:page] }
  expose(:post)

  # GET /posts
  def index
    authorize! :index, Post
    respond_with posts
  end

  # GET /posts/:id
  def show
    authorize! :show, post
    respond_with post
  end

  # GET /posts/:id/edit
  def edit
    authorize! :edit, post
    respond_with post
  end

  # PUT /posts/:id
  def update
    authorize! :update, post
    post.update_attributes params[:post]
    respond_with post
  end

  # DELETE /posts/:id
  def destroy
    authorize! :destroy, post
    post.destroy
    respond_with post
  end

end
