class Discover
  Destroy =
    lambda do |record_or_id, user: nil|
      record = record_or_id.is_a?(Discover) ? record_or_id : Discover.find(record_or_id)
      record.destroy
    end
end
