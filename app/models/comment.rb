class Comment < ActiveRecord::Base
  self.per_page = 5

  belongs_to :picture
  belongs_to :user

  validates :body, length: { minimum: 1, maximum: 100 }
end

