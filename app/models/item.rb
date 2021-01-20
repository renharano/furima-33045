class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user 
  has_one_attached :image
  belongs_to :category
  belongs_to :day
  belongs_to :judgment
  belongs_to :prefecture
  belongs_to :status

    validates :name, presence: true
    validates :text, presence: true
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :price, presence: true, numericality: {greater_than_or_equal_to: 300,less_than: 9999999},format: { with: /\A[a-zA-Z0-9]+\z/, message: "is invalid. Input full-width characters." }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :day_id, numericality: { other_than: 1 }
    validates :judgment_id, numericality: { other_than: 1 }
    validates :image, presence: true
end
