class Forums::NestedForumsController < ApplicationController

  before_filter :authenticate_member!, :except => :index

  respond_to :html

  expose(:forum)
  expose(:nested_forums)         { forum.nested_forums }
  expose(:nested_forums_in_page) { nested_forums.paginate :page => params[:page] }
  expose(:nested_forum)

  # GET /forums/:forum_id/nested_forums
  def index
    authorize! :index, Forum
    respond_with nested_forums
  end

  # GET /forums/:forum_id/nested_forums/new
  def new
    authorize! :new, nested_forum
    respond_with nested_forum
  end

  # POST /forums/:forum_id/nested_forums
  def create
    authorize! :create, nested_forum
    nested_forum.parent_forum = forum
    nested_forum.save
    respond_with nested_forum
  end

end
