class Categories::ForumsController < ApplicationController

  before_filter :authenticate_member!

  respond_to :html

  expose(:category)
  expose(:forums)         { category.forums }
  expose(:forums_in_page) { forums.paginate :page => params[:page] }
  expose(:forum)

  # GET /categories/:category_id/forums
  def index
    authorize! :index, Forum
    respond_with forums
  end

  # GET /categories/:category_id/forums/new
  def new
    authorize! :new, forum
    respond_with forum
  end

  # POST /categories/:category_id/forums
  def create
    authorize! :create, forum
    forum.category = category
    forum.save
    respond_with forum
  end

end
