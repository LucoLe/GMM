class Club < ActiveRecord::Base

  belongs_to :club_owner

  has_many :workouts, dependent: :destroy
  has_many :subscrioptions, dependent: :destroy
  has_many :members, through: :subscriptions

  validates :name, :country, :city, :address, :postal_code, :phone_number, presence: true

  validates :postal_code, :phone_number, numericality: { only_integer: true }


end
