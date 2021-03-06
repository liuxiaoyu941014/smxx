require 'rails_helper'

RSpec.describe FinanceBill::Create, type: :model do
  it 'with valid attributes' do
    attrs = attributes_for(:finance_bill)
    flag, record = FinanceBill::Create.(attrs)
    expect(flag).to eq(true)
    attrs.each_pair do |k, v|
      expect(record.send(k)).to eq(v)
    end
  end

  # it 'without title' do
  #   attrs = attributes_for(:finance_bill).slice(:name)
  #   flag, _ = FinanceBill::Create.(attrs)
  #   expect(flag).to eq(false)
  # end

  # it 'with existing record' do
  #   create(:finance_bill)
  #   attrs = attributes_for(:finance_bill)
  #   flag, _ = FinanceBill::Create.(attrs)
  #   expect(flag).to eq(false)
  # end

  pending "add some examples to (or delete) #{__FILE__}"
end
