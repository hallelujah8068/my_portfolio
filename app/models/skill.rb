class Skill < ApplicationRecord
  belongs_to :user
  enum category: { backend: 0, frontend: 1, infrastructure: 2 }

  validates :skill, presence: true
  validates :learning_time, presence: true, numericality: { greater_than_or_equal_to: 1 }

  scope :for_month, ->(month) { where("EXTRACT(MONTH FROM created_at) = ?", month) }
end
