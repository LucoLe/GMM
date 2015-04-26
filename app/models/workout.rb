class Workout < ActiveRecord::Base
  belongs_to :club
  belongs_to :member

  validates_presence_of :title
  validate :member_or_club

  private

    def member_or_club
      if (club_id.blank? and member_id.blank?)
        errors.add(:base, "Specify a club id or member id")
      end
    end
end
