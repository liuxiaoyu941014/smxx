class Order
  Destroy =
    lambda do |record_or_id, user: nil|
      record = record_or_id.is_a?(Order) ? record_or_id : Order.find(record_or_id)
      record.destroy
    end
end
