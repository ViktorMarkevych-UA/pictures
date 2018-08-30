class Category < ActiveRecord::Base

  has_many :pictures, dependent: :destroy
  belongs_to :user

  validates :name, presence: true, uniqueness: true
end
