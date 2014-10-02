class Post < ActiveRecord::Base
  belongs_to :user
  scope :latest ,order('update_at desc')
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true
end