class AddFinanceBillIdToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :finance_bill, foreign_key: true
  end
end
