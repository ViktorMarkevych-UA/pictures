class Picture < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  has_many :likes
  has_many :users, through: :likes
  
  validates :category_id, presence: true

  has_attached_file :pict, styles: { large: '640x480', medium: '242x200#', thumb: '171x180>' }
  validates_attachment_content_type :pict, content_type: /\Aimage\/.*\Z/
end
