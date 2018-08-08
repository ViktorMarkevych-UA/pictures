class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :positive_likes
  has_many :negative_likes
  has_many :categories

  # has_many :pictures, :through => :likes, :uniq => true
  has_many :pictures
  has_many :comments, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true

  def full_name
    [first_name, last_name].join(' ')
  end
end


