class Picture < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  has_many :likes
  has_many :users, through: :likes
  
  validates :category_id, presence: true

  has_attached_file :picture, styles: { large: '640x640',
                                                     medium: '300x300#',
                                                     thumb: '200x200#' },
                    url: '/:class/:attachment/:style/:filename',
                    path: ':rails_root/public:url'
  validates_attachment :pict, presence: true, content_type: /\Aimage\/.*\Z/

end
