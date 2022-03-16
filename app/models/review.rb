class Review < ApplicationRecord
  validates :title, presence: true
  validates :body, length: {minimum: 20}
  validates :score, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10}
  validates :blockchain, presence: true
end
