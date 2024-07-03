class Gold < ApplicationRecord
    belongs_to :item

    validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :base, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :sell, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :purchasable, inclusion: { in: [true, false] }
  end
  