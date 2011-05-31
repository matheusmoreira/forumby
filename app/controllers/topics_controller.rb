class TopicsController < ApplicationController

  before_filter :authenticate_member!, :except => [ :index, :show ]

  respond_to :html

  expose(:topics)         { Topic.all }
  expose(:topics_in_page) { topics.paginate :page => params[:page] }
  expose(:topic)

  authorize_resource

  # GET /topics
  def index
    respond_with topics
  end

  # GET /topics/:id
  def show
    respond_with topic
  end

  # GET /topics/:id/edit
  def edit
    respond_with topic
  end

  # PUT /topics/:id
  def update
    topic.update_attributes params[:topic]
    respond_with topic
  end

  # DELETE /topics/:id
  def destroy
    topic.destroy
    respond_with topic
  end

end
