class Members::PostsController < ApplicationController

  respond_to :html

  expose(:member)
  expose(:posts)         { member.posts }
  expose(:posts_in_page) { posts.paginate :page => params[:page] }

  # GET /members/:member_id/posts
  def index
    authorize! :index, Post
    respond_with posts
  end

end
