class Subscription < ActiveRecord::Base
  belongs_to :club
  belongs_to :member

  validates :club_id, :member_id, presence: true
end
