class MaterialWarehouse < Item
  audited
  store_accessor :features, :warehouse_user, :phone, :warehouse_address

  # 仓库只属于本公司，不能设置为其他Site
  after_initialize do
    self.site_id = Site::MAIN_ID
  end

  before_validation do
    self.site_id = Site::MAIN_ID
  end
end
