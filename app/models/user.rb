class User < ApplicationRecord
  has_many :task

  validates :name, presence: true
end
