class Cms::Page < ApplicationRecord
  belongs_to :channel
  default_scope {order('updated_at DESC')}

  validates :channel, :title, :content, presence: true
  validates :short_title, format: { with: /\A[a-zA-Z0-9-]+\z/,
    message: "名称简写只能包括字母数字和横线" }
  validates_uniqueness_of :short_title

  def format_date
    self.updated_at.strftime("%Y-%m-%d") unless self.updated_at.nil?
  end

  def thumb_image_path
    self.image_path.sub(/content|original/, 'thumb')
  end

  def original_image_path
    self.image_path.sub(/content|thumb/, 'original')
  end

  def show_image
    image_path.blank? ? 'http://placehold.it/250x150' : image_path
  end

  #最近新闻
  #eg: Cms::Page.recent(12, :rand => true)
  #    Cms::Page.recent(10, :channel => 'product-bed', :properties => '1')
  def self.recent(count = 10, options = {})
    queries     = []
    conditions  = []
    if options[:channel].present?
      queries     << 'cms_channels.short_title in (?)'
      conditions  << options[:channel]
    end
    # if options[:properties].present?
    #   queries     << 'admin_pages.properties regexp ?'
    #   conditions  << options[:properties]
    # end
    conditions.unshift(queries.join(' AND '))
    return Cms::Page.joins(:channel).where(conditions).order("updated_at DESC").limit(count)
  end

  #搜索
  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end

end
