class Reservation < ApplicationRecord
  belongs_to :admin
  belongs_to :user, optional: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
