class Product < ApplicationRecord
  belongs_to :user
  belongs_to :establishment
  belongs_to :ticket

  # validates :title, presence: true
  # validates :category, presence: true
  # validates :detail, presence: true
  # validates :condition, presence: true

end
