class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :likes
  # has_many :pictures, :through => :likes, :uniq => true
  has_many :pictures
  has_many :comments, :dependent => :destroy

  has_many :events, :as => :eventtable

  validates :email, :presence => true, :uniqueness => true

  after_create :create_use

  def full_name
    [first_name, last_name].join(' ')
  end

  def create_use
    self.events.create(:eventtable_body => "created_at", :user_id => self.id)
  end
end

