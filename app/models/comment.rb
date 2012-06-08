class Comment < ActiveRecord::Base

  belongs_to :picture
  belongs_to :user
  has_many :events, :as => :eventtable

  validates :body, :length => {:minimum => 1, :maximum => 100}

  after_create :create_com


  def create_com
  @eve = Event.new(:event_type => "User")
  @eve.save
  end

end
