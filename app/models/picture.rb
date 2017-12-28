class Picture < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  has_many :positive_likes
  has_many :negative_likes
  has_many :positive_users, through: :positive_likes, class_name: 'User'
  has_many :negative_users, through: :negative_likes, class_name: 'User'

  has_attached_file :image, styles: { view: '1024x768>',
                                           large: '640x640>',
                                           medium: '300x300#',
                                           thumb: '200x200#' },
                    url: '/:class/:attachment/:style/:filename',
                    path: ':rails_root/public:url'

  validates_attachment_content_type :image, content_type: /\Aimage/

  validates :category_id, presence: true

  def self.set_collections(options)
    if options[:category_id]
      where(category_id: options[:category_id]).order('positive_likes_count ASC')
    else
      order('positive_likes_count ASC')
    end
  end
end
