class Picture < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  has_many :users, :through => :like

  attr_accessible :cat_id, :img
end
