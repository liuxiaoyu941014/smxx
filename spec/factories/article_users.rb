<<<<<<< HEAD
=======
# == Schema Information
#
# Table name: article_users
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :article_user do
    user nil
    article nil
  end
end
