class Like < ActiveRecord::Base
  belongs_to :user

  include LikeSupport
end
