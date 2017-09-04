class OrderMember
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :mobile, :card_id, :product_id

  validates :mobile, format: { with: /\A1\d{10}\z/i,
    message: "手机号格式不正确" }, allow_blank: true
  validates :card_id, format: { with: /\A[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)\z/,
    message: "身份证号格式不正确" }, allow_blank: true

  validate :unique_card_id_with_product_id
  validates_presence_of :name

  def initialize(order_member)
    self.name = order_member[:name]
    self.mobile = order_member[:mobile]
    self.card_id = order_member[:card_id]
    self.product_id = order_member[:product_id]
  end

  def persisted?
    false
  end

  def unique_card_id_with_product_id
    if self.product_id && self.card_id
      order_products = OrderProduct.where(product_id: self.product_id)
      order_products.each do |order_product|
        order = order_product.order
        if order.member_attributes && order.member_attributes.map{|om| om["card_id"]}.include?(self.card_id)
          errors.add(:card_id, "已经存在")
        end
      end
    end
  end
end