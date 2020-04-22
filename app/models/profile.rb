class Profile < ActiveRecord::Base
  belongs_to :user
  validates :comments, presence: true
  validates :firstsong, presence: true
  validates :secondsong, presence: true
  validates :thirdsong, presence: true
end