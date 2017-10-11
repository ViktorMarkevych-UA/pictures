class Comment < ActiveRecord::Base
  self.per_page = 5

  belongs_to :picture
  belongs_to :user
  has_many :events, as: :eventtable

  validates :body, length: { minimum: 1, maximum: 100 }

  after_create :create_comment_event

  def create_comment_event
    # events.create(eventtable_body: body, user_id: user_id)
  end

end

