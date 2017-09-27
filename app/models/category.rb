class Category < ActiveRecord::Base
  has_many :pictures
  # attr_accessible :name, :picture
end
