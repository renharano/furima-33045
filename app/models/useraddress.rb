class Useraddress

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :user_id


  with_options presence: true do
    validates :post_code #format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city
    validates :address
    validates :phone_number #format: { with: less_than: 11, message: "can't be blank" }
    validates :item_id
    validates :user_id
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  

  def save
    # ユーザーの情報を保存し、「user」という変数に入れている
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name,phone_number: phone_number, order_id: order.id)
  end
end