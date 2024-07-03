class Item < ApplicationRecord
    has_one :gold, dependent: :destroy
    has_one :stat, dependent: :destroy
    has_many :item_tags, dependent: :destroy
    has_many :tags, through: :item_tags
  
    accepts_nested_attributes_for :gold, :stat, :tags

    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
    validates :image, presence: true
  end
  