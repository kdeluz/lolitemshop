class ItemsController < ApplicationController
    def index
      @tags = Tag.all
      if params[:tag]
        logger.debug "Filtering items by tag: #{params[:tag]}"
        tag = Tag.find_by(name: params[:tag])
        if tag
          @items = tag.items.includes(:gold, :stat, :tags)
          logger.debug "Found #{@items.count} items for tag: #{params[:tag]}"
        else
          @items = Item.none
          logger.debug "No items found for tag: #{params[:tag]}"
        end
      else
        @items = Item.includes(:gold, :stat, :tags).all
      end
    end
  
    def show
      @item = Item.find(params[:id])
    end
  end
  