class MemberCatalog
  Destroy =
    lambda do |record_or_id, user: nil|
      record = record_or_id.is_a?(MemberCatalog) ? record_or_id : MemberCatalog.find(record_or_id)
      record.destroy
    end
end
