class Like < ActiveRecord::Base
  belongs_to :picture, counter_cache: true
  belongs_to :user

  has_many :events, as: :eventtable

  after_create :create_like

  def create_like
    self.events.create(user: user)
  end

  def self.manage_like_for(picture, current_user)
    like = picture.likes.where(user_id: current_user.id).first
    like.present? ? (like.delete; false) : picture.likes.create(user_id: current_user.id)
  end
end
