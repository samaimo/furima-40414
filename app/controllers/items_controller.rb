class ItemsController < ApplicationController
  def index
    @items = Items.all
  end

  def new
    @item = Item.new
  end

  def create
  end
end
