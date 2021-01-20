class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user 
  has_one_attached :image
  belongs_to :category
  belongs_to :day
  belongs_to :judgment
  belongs_to :prefecture
  belongs_to :status
  with_options presence: true do
    validates :name
    validates :text
    validates :price, format: { with: /\A[a-zA-Z0-9]+\z/ }, inclusion: {in: 300..9999999}
    validates :image
  end
  
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :day_id, numericality: { other_than: 1 }
  validates :judgment_id, numericality: { other_than: 1 }
end
