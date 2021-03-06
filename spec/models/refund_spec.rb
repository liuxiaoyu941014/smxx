# == Schema Information
#
# Table name: refunds
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  pingpp_charge_id :string
#  event_id         :string
#  order_no         :string
#  description      :text
#  charge           :string
#  amount           :string
#  created          :string
#  charge_order_no  :string
#  succeed          :string
#  status           :string
#  time_succeed     :string
#  failure_code     :string
#  failure_msg      :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  order_id         :integer
#

require 'rails_helper'

RSpec.describe Refund, type: :model do

  describe "Create/Update/Destroy" do
    it { expect(described_class::Create).to be_a(Proc) }
    it { expect(described_class::Update).to be_a(Proc) }
    it { expect(described_class::Destroy).to be_a(Proc) }
  end

  it do
    expect(described_class.attribute_names).to match_array(%w(id pingpp_charge_id event_id order_no description charge amount created succeed status time_succeed failure_code failure_msg updated_at created_at))
  end

  # it { should have_many(:xxx) }
  # it { should belong_to :xxx }
  # it { should validate_presence_of :xxx }
  # it { should validate_uniqueness_of(:a).scoped_to(:b) }
  # it { should have_attr_accessor :xxx }

  describe "Instance" do
    subject { build(:refund) }

    it 'is valid with valid attribues' do
      expect(subject).to be_valid
    end

    # it 'is invalid with invalid attribues' do
    #   expect(described_class.new).not_to be_valid
    # end

  end

  it 'is versioned' do
    record = create(:refund)
    expect(record.audits.size).to eq(1)
  end

  pending "add some examples to (or delete) #{__FILE__}"
end
