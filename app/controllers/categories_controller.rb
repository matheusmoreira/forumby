class CategoriesController < ApplicationController

  before_filter :authenticate_member!, :except => [ :index, :show ]

  respond_to :html

  expose(:categories)         { Category.all }
  expose(:categories_in_page) { categories.paginate :page => params[:page] }
  expose(:category)
  expose(:forums)             { category.forums }

  authorize_resource

  # GET /categories
  def index
    respond_with categories
  end

  # GET /categories/:id
  def show
    respond_with category
  end

  # GET /categories/new
  def new
    respond_with category
  end

  # POST /categories
  def create
    category.save
    respond_with category
  end

  # GET /categories/:id/edit
  def edit
    respond_with category
  end

  # PUT /categories/:id
  def update
    category.update_attributes params[:category]
    respond_with category
  end

  # DELETE /categories/:id
  def destroy
    category.destroy
    respond_with category
  end

end
