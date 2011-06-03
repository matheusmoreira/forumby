class MembersController < ApplicationController

  respond_to :html

  expose(:members)         { Member.all }
  expose(:members_in_page) { members.paginate :page => params[:page] }
  expose(:member)

  # GET /members
  def index
    authorize! :index, Member
    respond_with members
  end

  # GET /members/:id
  def show
    authorize! :show, member
    respond_with member
  end

end
