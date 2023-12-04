class Product < ApplicationRecord
  belongs_to :user
  belongs_to :establishment
  belongs_to :ticket

  validates :title, presence: true
  validates :category, presence: true
  validates :detail, presence: true
  validates :condition, presence: true

  has_one_attached :picture1
  has_one_attached :picture2
  has_one_attached :picture3
end
