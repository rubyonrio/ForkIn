class ItemsController < ApplicationController

  respond_to :html, :js

  # GET /items
  # GET /items.xml
  def index
    @items = Item.all

    respond_with @items
  end

  # GET /items/1
  # GET /items/1.xml
  def show
    @item = Item.find(params[:id])

    respond_with @item
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @item = Item.new

    respond_with @item
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.xml
  def create
    @item = Item.new(params[:item])
    
    flash[:notice] = 'Item was successfully created.' if @item.save

    respond_with @item
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update
    @item = Item.find(params[:id])

    flash[:notice] = 'Item was successfully updated.' if @item.update_attributes(params[:item])
    
    respond_with @item
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @item = Item.find(params[:id])
    
    flash[:notice] = 'Items deleted' if @item.destroy

    respond_with @item
  end
end
