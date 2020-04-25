class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :comments, presence: true
  validates :firstsong, presence: true
  validates :secondsong, presence: true
  validates :thirdsong, presence: true
end