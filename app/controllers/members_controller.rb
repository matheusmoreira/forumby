class MembersController < ApplicationController

  respond_to :html

  expose(:members)         { Member.all }
  expose(:members_in_page) { members.paginate :page => params[:page] }
  expose(:member)

  # GET /members
  def index
    respond_with members
  end

  # GET /members/:id
  def show
    respond_with member
  end

end
