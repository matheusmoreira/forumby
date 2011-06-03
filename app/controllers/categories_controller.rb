class CategoriesController < ApplicationController

  before_filter :authenticate_member!, :except => [ :index, :show ]

  respond_to :html

  expose(:categories)         { Category.all }
  expose(:categories_in_page) { categories.paginate :page => params[:page] }
  expose(:category)
  expose(:forums)             { category.forums }

  # GET /categories
  def index
    authorize! :index, Category
    respond_with categories
  end

  # GET /categories/:id
  def show
    authorize! :show, category
    respond_with category
  end

  # GET /categories/new
  def new
    authorize! :new, category
    respond_with category
  end

  # POST /categories
  def create
    authorize! :create, category
    category.save
    respond_with category
  end

  # GET /categories/:id/edit
  def edit
    authorize! :edit, category
    respond_with category
  end

  # PUT /categories/:id
  def update
    authorize! :update, category
    category.update_attributes params[:category]
    respond_with category
  end

  # DELETE /categories/:id
  def destroy
    authorize! :destroy, category
    category.destroy
    respond_with category
  end

end
