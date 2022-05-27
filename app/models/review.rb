class Review < ApplicationRecord
  belongs_to :superpower
  validates :content, presence: true
end
