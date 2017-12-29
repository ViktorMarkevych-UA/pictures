class Like < ActiveRecord::Base
  belongs_to :user
  has_many :events, as: :eventtable

  include LikeSupport

  after_create :create_like

  def create_like
    self.events.create(user: user)
  end
end
