class ItemsController < ApplicationController
    def index
      @tags = Tag.all
      @sort = params[:sort]
  
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
  
      @items = sort_items(@items, @sort)
    end
  
    def show
      @item = Item.find(params[:id])
    end
  
    private
  
    def sort_items(items, sort)
      case sort
      when 'alphabetical'
        items.order(:name)
      when 'gold_ascending'
        items.joins(:gold).order('golds.total ASC')
      when 'gold_descending'
        items.joins(:gold).order('golds.total DESC')
      else
        items
      end
    end
  end
  