class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :establishment

  # validates :date, presence: true
end
