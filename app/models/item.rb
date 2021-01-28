class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user 
  has_one_attached :image
  
  belongs_to_active_hash :category
  belongs_to_active_hash :day
  belongs_to_active_hash :judgment
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status

  has_one :order

  with_options presence: true do
    validates :name
    validates :text
    validates :price, format: { with: /\A[a-zA-Z0-9]+\z/ }, inclusion: {in: 300..9999999}
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :prefecture_id
    validates :day_id
    validates :judgment_id
  end
end
