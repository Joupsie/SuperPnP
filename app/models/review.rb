class Review < ApplicationRecord
  belongs_to :superpower, dependent: :delete
  validates :content, presence: true
end
