<<<<<<< HEAD
=======
# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  owner_type :string
#  owner_id   :integer
#  name       :string
#  amount     :decimal(8, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :account do
    owner nil
    name "MyString"
    amount ""
    amount ""
  end
end
