class Article < ApplicationRecord
  # Relationships
  belongs_to :user
  has_many :comments

  # Validations
  validates :title, presence: true
  validates :content, presence: true
end
