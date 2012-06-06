class Category < ActiveRecord::Base
  has_many :pictures
  attr_accessible :name, :picture
  #accepts_nested_attributes_for :picture, :allow_destroy => true

end
