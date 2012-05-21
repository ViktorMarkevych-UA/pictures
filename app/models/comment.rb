class Comment < ActiveRecord::Base
  belongs_to :picture
  attr_accessible :body, :pic_id, :title
end
