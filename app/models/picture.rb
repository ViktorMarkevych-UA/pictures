class Picture < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  has_many :users, :through => :like
  has_many :likes
  attr_accessible :category_id, :name, :pict

  has_attached_file :pict, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
