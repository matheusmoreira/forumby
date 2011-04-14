class MembersController < ApplicationController

  respond_to :html

  expose(:members)         { Member.all }
  expose(:members_in_page) { members.paginate page: params[:page] }
  expose(:member)

  def index
    respond_with members
  end

  def show
    respond_with member
  end

end
