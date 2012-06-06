class Like < ActiveRecord::Base
  belongs_to :picture, :counter_cache => true
  belongs_to :user

  #attr_accessible :pic_id, :user_id
end
