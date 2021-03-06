# == Schema Information
#
# Table name: logistics
#
#  id                :integer          not null, primary key
#  order_delivery_id :integer
#  delivery_id       :integer
#  status            :integer
#  update_by         :integer
#  create_by         :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Logistic < ApplicationRecord
  audited
  enum status: {
    in_transit: 0,   # 运输中
    completed: 1,   # 已到达
  }

  belongs_to :order_delivery
  belongs_to :delivery
  belongs_to :create_user, foreign_key: :create_by, class_name: 'User'
  belongs_to :update_user, foreign_key: :update_by, class_name: 'User'
  validates_presence_of :delivery_id

  before_save do
    if self.status.blank?
      self.status = 0
    end
  end
end
