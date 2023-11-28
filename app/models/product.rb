class Product < ApplicationRecord
  belongs_to :user
  belongs_to :establishment
  belongs_to :ticket
end
