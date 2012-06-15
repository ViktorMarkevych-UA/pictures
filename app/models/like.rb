class Like < ActiveRecord::Base
  belongs_to :picture, :counter_cache => true
  belongs_to :user

  has_many :events, :as => :eventtable

  after_create :create_like

  def create_like
    self.events.create(:user_id => user.id)
  end

end
