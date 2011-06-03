class TopicsController < ApplicationController

  before_filter :authenticate_member!, :except => [ :index, :show ]

  respond_to :html

  expose(:topics)         { Topic.all }
  expose(:topics_in_page) { topics.paginate :page => params[:page] }
  expose(:topic)

  # GET /topics
  def index
    authorize! :index, Topic
    respond_with topics
  end

  # GET /topics/:id
  def show
    authorize! :show, topic
    respond_with topic
  end

  # GET /topics/:id/edit
  def edit
    authorize! :edit, topic
    respond_with topic
  end

  # PUT /topics/:id
  def update
    authorize! :update, topic
    topic.update_attributes params[:topic]
    respond_with topic
  end

  # DELETE /topics/:id
  def destroy
    authorize! :destroy, topic
    topic.destroy
    respond_with topic
  end

end
