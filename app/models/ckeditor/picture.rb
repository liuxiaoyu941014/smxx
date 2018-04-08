# == Schema Information
#
# Table name: ckeditor_assets
#
#  id                :integer          not null, primary key
#  data_file_name    :string           not null
#  data_content_type :string
#  data_file_size    :integer
#  data_fingerprint  :string
#  type              :string(30)
#  width             :integer
#  height            :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  assetable_id      :integer          not null
#  assetable_type    :string(30)
#

class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    url: '/ckeditor_assets/pictures/:id/:style_:basename.:extension',
                    path: ':rails_root/public/ckeditor_assets/pictures/:id/:style_:basename.:extension',
                    styles: { medium: '800>', thumb: '300x225#' }

  validates_attachment_presence :data
  validates_attachment_size :data, less_than: 5.megabytes
  validates_attachment_content_type :data, content_type: /\Aimage/

  def url_medium
    url(:medium)
  end
end
