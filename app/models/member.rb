class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :workouts, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :clubs, through: :subscriptions

  validates :first_name, :last_name, presence: true
end
