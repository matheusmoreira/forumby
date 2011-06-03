class ForumsController < ApplicationController

  before_filter :authenticate_member!, :except => [ :index, :show ]

  respond_to :html

  expose(:forums)         { Forum.all }
  expose(:forums_in_page) { forums.paginate :page => params[:page] }
  expose(:forum)

  # GET /forums
  def index
    authorize! :index, Forum
    respond_with forums
  end

  # GET /forums/:id
  def show
    authorize! :show, forum
    respond_with forum
  end

  # GET /forums/new
  def new
    authorize! :new, forum
    respond_with forum
  end

  # POST /forums
  def create
    authorize! :create, forum
    forum.save
    respond_with forum
  end

  # GET /forums/:id/edit
  def edit
    authorize! :edit, forum
    respond_with forum
  end

  # PUT /forums/:id
  def update
    authorize! :update, forum
    forum.update_attributes params[:forum]
    respond_with forum
  end

  # DELETE /forums/:id
  def destroy
    authorize! :destroy, forum
    forum.destroy
    respond_with forum
  end

end
