class Picture < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  has_many :likes
  has_many :users, through: :likes

  has_attached_file :image, styles: { large: '640x640>',
                                           medium: '300x300#',
                                           thumb: '200x200#' },
                    url: '/:class/:attachment/:style/:filename',
                    path: ':rails_root/public:url'

  validates_attachment_content_type :image, content_type: /\Aimage/

  validates :category_id, presence: true

  def self.set_collections(options)
    if options[:category_id]
      where(category_id: options[:options]).order('likes_count ASC')
    else
      order('likes_count ASC')
    end
  end
end
