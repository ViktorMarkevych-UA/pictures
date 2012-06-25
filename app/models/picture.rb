class Picture < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  has_many :users, :through => :like
  has_many :likes

  attr_accessible :category_id, :pict

  validates :category_id, :presence => true

  has_attached_file :pict, :styles => { :large => "640x480", :medium => "300x300>", :thumb => "100x100>" }
end