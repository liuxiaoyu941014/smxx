require 'rails_helper'

RSpec.describe OrderMaterial::Create, type: :model do
  it 'with valid attributes' do
    attrs = attributes_for(:order_material)
    flag, record = OrderMaterial::Create.(attrs)
    expect(flag).to eq(true)
    attrs.each_pair do |k, v|
      expect(record.send(k)).to eq(v)
    end
  end

  # it 'without title' do
  #   attrs = attributes_for(:order_material).slice(:name)
  #   flag, _ = OrderMaterial::Create.(attrs)
  #   expect(flag).to eq(false)
  # end

  # it 'with existing record' do
  #   create(:order_material)
  #   attrs = attributes_for(:order_material)
  #   flag, _ = OrderMaterial::Create.(attrs)
  #   expect(flag).to eq(false)
  # end

  pending "add some examples to (or delete) #{__FILE__}"
end
