class Like < ActiveRecord::Base
  belongs_to :pictures, :counter_cache => true

  attr_accessible :pic_id, :user_id
end
