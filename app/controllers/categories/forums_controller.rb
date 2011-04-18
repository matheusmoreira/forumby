class Categories::ForumsController < ApplicationController

  before_filter :authenticate_member!

  respond_to :html

  expose(:category)
  expose(:forums)         { category.forums }
  expose(:forums_in_page) { forums.paginate :page => params[:page] }
  expose(:forum)

  authorize_resource

  # GET /categories/:category_id/forums
  def index
    respond_with forums
  end

  # GET /categories/:category_id/forums/new
  def new
    respond_with forum
  end

  # POST /categories/:category_id/forums
  def create
    forum.category = category
    forum.save
    respond_with forum
  end

end
