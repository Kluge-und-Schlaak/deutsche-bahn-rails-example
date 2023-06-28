class Task < ApplicationRecord
  belongs_to :user

  scope :newest_to_oldest, -> { order(created_at: :desc) }

  validates :title, :user, :description, presence: true
end
