class AccountHistory < ApplicationRecord
  audited
  belongs_to :account
end
