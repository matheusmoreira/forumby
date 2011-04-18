class ForumsController < ApplicationController

  before_filter :authenticate_member!, :except => [ :index, :show ]

  respond_to :html

  expose(:forums)         { Forum.all }
  expose(:forums_in_page) { forums.paginate :page => params[:page] }
  expose(:forum)

  authorize_resource

  # GET /forums
  def index
    respond_with forums
  end

  # GET /forums/:id
  def show
    respond_with forum
  end

  # GET /forums/:id/edit
  def edit
    respond_with forum
  end

  # PUT /forums/:id
  def update
    forum.update_attributes params[:forum]
    respond_with forum
  end

  # DELETE /forums/:id
  def destroy
    forum.destroy
    respond_with forum
  end

end
