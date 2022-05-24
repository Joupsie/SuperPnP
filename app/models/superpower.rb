class Superpower < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name,
                    against: [ :name ],
                    using: { tsearch: { prefix: true } }
end
