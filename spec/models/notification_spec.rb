# == Schema Information
#
# Table name: notifications
#
#  id                 :integer          not null, primary key
#  user_id            :integer          not null
#  actor_id           :integer
#  notify_type        :string           not null
#  target_type        :string
#  target_id          :integer
#  target_url         :string
#  target_name        :string
#  second_target_type :string
#  second_target_id   :integer
#  second_target_url  :string
#  second_target_name :string
#  third_target_type  :string
#  third_target_id    :integer
#  third_target_url   :string
#  third_target_name  :string
#  content            :string
#  read_at            :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'rails_helper'

RSpec.describe Notification, type: :model do

  describe "Create/Update/Destroy" do
    it { expect(described_class::Create).to be_a(Proc) }
    it { expect(described_class::Update).to be_a(Proc) }
    it { expect(described_class::Destroy).to be_a(Proc) }
  end

  it do
    expect(described_class.attribute_names).to match_array(%w(id user_id actor_id notify_type target second_target third_target read_at updated_at created_at))
  end

  # it { should have_many(:xxx) }
  # it { should belong_to :xxx }
  # it { should validate_presence_of :xxx }
  # it { should validate_uniqueness_of(:a).scoped_to(:b) }
  # it { should have_attr_accessor :xxx }

  describe "Instance" do
    subject { build(:notification) }

    it 'is valid with valid attribues' do
      expect(subject).to be_valid
    end

    # it 'is invalid with invalid attribues' do
    #   expect(described_class.new).not_to be_valid
    # end

  end

  it 'is versioned' do
    record = create(:notification)
    expect(record.audits.size).to eq(1)
  end

  pending "add some examples to (or delete) #{__FILE__}"
end
