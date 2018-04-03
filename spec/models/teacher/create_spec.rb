require 'rails_helper'

RSpec.describe Teacher::Create, type: :model do
  it 'with valid attributes' do
    attrs = attributes_for(:teacher)
    flag, record = Teacher::Create.(attrs)
    expect(flag).to eq(true)
    attrs.each_pair do |k, v|
      expect(record.send(k)).to eq(v)
    end
  end

  # it 'without title' do
  #   attrs = attributes_for(:teacher).slice(:name)
  #   flag, _ = Teacher::Create.(attrs)
  #   expect(flag).to eq(false)
  # end

  # it 'with existing record' do
  #   create(:teacher)
  #   attrs = attributes_for(:teacher)
  #   flag, _ = Teacher::Create.(attrs)
  #   expect(flag).to eq(false)
  # end

  pending "add some examples to (or delete) #{__FILE__}"
end
