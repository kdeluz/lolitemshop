class ItemsController < ApplicationController
    def index
      @tags = Tag.all
      @sort = params[:sort]
      @search = params[:search]
      @tag_filter = params[:tag]
  
      @items = Item.includes(:gold, :stat, :tags)
  
      if @tag_filter.present?
        tag = Tag.find_by(name: @tag_filter)
        @items = tag.items.includes(:gold, :stat, :tags) if tag
      end
  
      if @search.present?
        @items = @items.where('LOWER(items.name) LIKE ?', "%#{@search.downcase}%")
      end
  
      @items = sort_items(@items, @sort).page(params[:page]).per(20)
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
  